local dappy_status_ok, dappy = pcall(require, "dap-python")
if not dappy_status_ok then
    return
end

dappy.setup()
dappy.test_runner = 'pytest'
