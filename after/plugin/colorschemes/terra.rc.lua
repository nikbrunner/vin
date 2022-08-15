local present, terra = pcall(require, "terra")
if not present then
    return
end

if Vin.colorscheme.theme == "terra" then
    terra.setup()
end
