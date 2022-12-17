local present, terra = pcall(require, "terra")
if not present then
    return
end

terra.setup({
    season = "summer"
})
