return {
    settings = {
        gopls = {
            gofumpt = true,
            analyses = {
                nilness = true,
                unusedwrite = true,
                unusedvariable = true
            }
        }
    }
}
