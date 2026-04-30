-- ~/.config/nvim/lua/gounit.lua
--
-- Lua port of gounit-vim (https://github.com/hexdigest/gounit-vim).
-- Install the gounit binary yourself:
--   go install github.com/hexdigest/gounit/cmd/gounit@latest

local M = {}

M.config = {
	gounit_bin = "gounit",
}

local plugin_name = "gounit"

----------------------------------------------------------------------
-- Notification helpers
----------------------------------------------------------------------

local function info(msg)
	vim.notify("gounit: " .. msg, vim.log.levels.INFO)
end

local function warn(msg)
	vim.notify("gounit: " .. msg, vim.log.levels.WARN)
end

local function err(msg)
	vim.notify("gounit: " .. msg, vim.log.levels.ERROR)
end

local _missing_notified = false
local function notify_missing_binary()
	if _missing_notified then
		return
	end
	_missing_notified = true
	err(
		string.format(
			"'%s' not found in $PATH. Install it with: " .. "go install github.com/hexdigest/gounit/cmd/gounit@latest",
			M.config.gounit_bin
		)
	)
end

local function ensure_binary()
	if vim.fn.executable(M.config.gounit_bin) == 1 then
		return true
	end
	notify_missing_binary()
	return false
end

----------------------------------------------------------------------
-- Test generation
----------------------------------------------------------------------

-- Vim regex matching a Go function declaration. Captures the function
-- name via \zs/\ze. Handles both:
--   func Foo(...)
--   func (r *T) Foo(...)
local FUNC_PAT = [[^func\s\+\%((\_[^)]\+)\s*\)\?\zs\w\+\ze\s*(]]

local function is_func_line(lineno)
	local line = vim.fn.getline(lineno)
	return vim.fn.matchstr(line, FUNC_PAT) ~= ""
end

function M.tests(line1, line2, tmpl)
	if not ensure_binary() then
		return
	end

	line1 = line1 or vim.fn.line(".")
	line2 = line2 or line1

	-- 1) Look for a func decl inside the given range. Last one wins,
	--    matching the original gounit-vim behaviour.
	local func_line = 0
	for lineno = line1, line2 do
		if is_func_line(lineno) then
			func_line = lineno
		end
	end

	-- 2) If nothing was on the range itself (typical when the cursor is
	--    inside the function body), walk backwards to find the enclosing
	--    func line.
	if func_line == 0 then
		for lineno = line1, 1, -1 do
			if is_func_line(lineno) then
				func_line = lineno
				break
			end
		end
	end

	if func_line == 0 then
		info("No function selected!")
		return
	end

	if tmpl and tmpl ~= "" then
		M.template_use(tmpl)
	end

	local file = vim.fn.expand("%")
	local out = vim.fn.system({ M.config.gounit_bin, "gen", "-l", tostring(func_line), "-i", file })
	if out ~= "" then
		info(out)
	else
		info("test successfully generated")
	end
end

----------------------------------------------------------------------
-- Template management
----------------------------------------------------------------------

function M.parse_template_list()
	if vim.fn.executable(M.config.gounit_bin) ~= 1 then
		return {}
	end

	local out = vim.fn.system({ plugin_name, "template", "list" })
	local lines = vim.split(out, "\n", { plain = true })
	if #lines > 0 then
		table.remove(lines, 1)
	end

	local result = {}
	for _, line in ipairs(lines) do
		if line ~= "" then
			for _, tok in ipairs(vim.split(line, " ", { plain = true })) do
				if tok ~= "" and tok ~= "*" then
					table.insert(result, tok)
				end
			end
		end
	end
	return result
end

function M.template_use(name)
	if not ensure_binary() then
		return
	end

	local found = false
	for _, t in ipairs(M.parse_template_list()) do
		if t == name then
			found = true
			break
		end
	end
	if not found then
		err("no such template")
		return
	end

	vim.fn.system({ plugin_name, "template", "use", name })
	info("template has been changed to " .. name)
end

function M.template_del(name)
	if not ensure_binary() then
		return
	end
	if name == "default" then
		err("cannot delete default template")
		return
	end

	local found = false
	for _, t in ipairs(M.parse_template_list()) do
		if t == name then
			found = true
			break
		end
	end
	if not found then
		err("no such template")
		return
	end

	vim.fn.system({ plugin_name, "template", "remove", name })
	info(name .. " template has been removed")
end

function M.template_add(filepath)
	if not ensure_binary() then
		return
	end

	if not filepath or filepath == "" then
		filepath = vim.fn.expand("%:p")
	elseif vim.fn.filereadable(filepath) ~= 1 then
		err(filepath .. " is not found")
		return
	end

	local out = vim.fn.system({ plugin_name, "template", "add", filepath })
	if out ~= "" then
		warn(out)
	else
		info(vim.fn.fnamemodify(filepath, ":t") .. " template has been added to your gounit list")
	end
end

function M.template_list()
	if not ensure_binary() then
		return
	end
	local out = vim.fn.system({ plugin_name, "template", "list" })
	local lines = vim.split(out, "\n", { plain = true })
	if #lines > 0 then
		table.remove(lines, 1)
	end
	info("list of installed templates")
	for _, line in ipairs(lines) do
		if line ~= "" then
			print(line)
		end
	end
end

----------------------------------------------------------------------
-- Commands & autocmd
----------------------------------------------------------------------

local function complete_templates(_, _, _)
	return M.parse_template_list()
end

function M.add_unit_command()
	vim.api.nvim_buf_create_user_command(0, "GoUnit", function(opts)
		M.tests(opts.line1, opts.line2, opts.fargs[1])
	end, {
		range = true,
		nargs = "?",
		complete = complete_templates,
	})
end

function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", M.config, opts or {})

	vim.api.nvim_create_user_command("GoUnitTemplateUse", function(o)
		M.template_use(o.fargs[1])
	end, { nargs = 1, complete = complete_templates })

	vim.api.nvim_create_user_command("GoUnitTemplateDel", function(o)
		M.template_del(o.fargs[1])
	end, { nargs = 1, complete = complete_templates })

	vim.api.nvim_create_user_command("GoUnitTemplateAdd", function(o)
		M.template_add(o.fargs[1])
	end, { nargs = "?", complete = "file" })

	vim.api.nvim_create_user_command("GoUnitTemplateList", function()
		M.template_list()
	end, {})

	local group = vim.api.nvim_create_augroup("gounit", { clear = true })
	vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
		group = group,
		pattern = "*.go",
		callback = function()
			M.add_unit_command()
		end,
	})
end

return M
