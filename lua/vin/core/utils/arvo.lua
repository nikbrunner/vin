Vin.arvo = {}

---Check if the Arvo Customization is enabled
---@return boolean
function Vin.arvo.is_enabled()
	return Vin.utils.pget_var(IS_ARVO_ENABLED, false)
end

---Enable / Disable Arvo
---@param should_arvo_be_enabled boolean Should the Arvo Customization be enabled
---@return void
function Vin.arvo.enable(should_arvo_be_enabled)
	vim.api.nvim_set_var(IS_ARVO_ENABLED, should_arvo_be_enabled)
end
