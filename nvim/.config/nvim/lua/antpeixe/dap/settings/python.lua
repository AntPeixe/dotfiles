local dappy_status_ok, dappy = pcall(require, "dap-python")
if not dappy_status_ok then
    return
end

dappy.setup(os.getenv("HOME") .. '/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
dappy.test_runner = 'pytest'
