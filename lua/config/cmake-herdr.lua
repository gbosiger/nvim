local M = { pane_id = nil }

local function run(command)
  return vim.fn.system(command)
end

local function shell_quote(value)
  return vim.fn.shellescape(value)
end

function M.show() end

function M.close()
  if M.pane_id then
    run({ "herdr", "pane", "close", M.pane_id })
    M.pane_id = nil
  end
end

function M.stop()
  if M.pane_id then run({ "herdr", "pane", "send-keys", M.pane_id, "C-c" }) end
end

function M.has_active_job()
  return false
end

function M.is_installed()
  if vim.fn.executable("herdr") == 0 then return "herdr is not installed" end
  return true
end

local function ensure_pane(cwd)
  if M.pane_id then
    run({ "herdr", "pane", "get", M.pane_id })
    if vim.v.shell_error == 0 then return true end
    M.pane_id = nil
  end

  local split = vim.json.decode(run({
    "herdr",
    "pane",
    "split",
    "--current",
    "--direction",
    "down",
    "--cwd",
    cwd,
    "--no-focus",
  }))
  M.pane_id = split.result and split.result.pane and split.result.pane.pane_id
  return M.pane_id ~= nil
end

function M.run(cmd, _, env, args, cwd, _, on_exit)
  if not ensure_pane(cwd) then
    if on_exit then on_exit(1) end
    return
  end

  local command = { "cd", shell_quote(cwd), "&&" }
  for key, value in pairs(env or {}) do
    table.insert(command, key .. "=" .. shell_quote(value))
  end
  table.insert(command, shell_quote(cmd))
  for _, arg in ipairs(args or {}) do table.insert(command, shell_quote(arg)) end

  run({ "herdr", "pane", "run", M.pane_id, "sh", "-lc", table.concat(command, " ") })
  if on_exit then on_exit(0) end
end

return M
