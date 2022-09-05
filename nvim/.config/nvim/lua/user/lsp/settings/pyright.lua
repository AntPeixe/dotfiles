local status_ok, util = pcall(require, "lspconfig.util")
if not status_ok then
	return
end

-- Use only `pyrightconfig.json` file as root marker.
-- Useful for monorepos with multiple requirements and shared code.
local root_files = {
    'pyrightconfig.json',
}

return {
	settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic"
          }
        }
	},
    root_dir = util.root_pattern(unpack(root_files)),
}
