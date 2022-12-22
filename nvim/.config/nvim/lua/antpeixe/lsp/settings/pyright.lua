local status_ok, util = pcall(require, "lspconfig.util")
if not status_ok then
	return
end

return {
	settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic"
          }
        }
	},
    -- Use only `pyrightconfig.json` file as root marker.
    -- Useful for monorepos with multiple requirements and shared code.
    root_dir = util.root_pattern('pyrightconfig.json'),
}
