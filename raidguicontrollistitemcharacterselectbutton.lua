RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION = "change_nation"
RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_AMERICAN = "change_nation_american"
RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_BRITISH = "change_nation_british"
RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_RUSSIAN = "change_nation_russian"
RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_GERMAN = "change_nation_german"

Hooks:PostHook(RaidGUIControlListItemCharacterSelectButton, "init",
	"bernadettaprofile_RaidGUIControlListItemCharacterSelectButtoninit",
	function(self, parent, params)
		-- restore pre-U21 style
		self._icon:set_x(43)
		self._icon:set_y(16)
		self._label:set_x(0)
		self._label:set_y(60)
		self._label:set_visible(true)
	end
)

Hooks:PostHook(RaidGUIControlListItemCharacterSelectButton, "highlight_on",
	"bernadettaprofile_RaidGUIControlListItemCharacterSelectButtonhighlight_on",
	function(self)
		-- restore pre-U21 style
		self._icon:set_visible(true)
	end
)

Hooks:PostHook(RaidGUIControlListItemCharacterSelectButton, "highlight_off",
	"bernadettaprofile_RaidGUIControlListItemCharacterSelectButtonhighlight_off",
	function(self)
		-- restore pre-U21 style
		self._label:set_visible(true)
	end
)

function RaidGUIControlListItemCharacterSelectButton:on_mouse_released()
	if self._special_action_callback then
		self._special_action_callback(self._params.slot_index, self._button_type, self._params, self)

		return true
	end
end

Hooks:PostHook(RaidGUIControlListItemCharacterSelectButton, "set_button",
	"bernadettaprofile_RaidGUIControlListItemCharacterSelectButtonset_button",
	function(self, button_type)
		if button_type == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CUSTOMIZE then
			-- restore pre-U21 icon
			self._icon:set_image(tweak_data.gui.icons.list_btn_ico_customize.texture)
			self._icon:set_texture_rect(tweak_data.gui.icons.list_btn_ico_customize.texture_rect)
		elseif button_type == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION then
			-- restore pre-U21 icon
			self._icon:set_image(tweak_data.gui.icons.list_btn_ico_shirt.texture)
			self._icon:set_texture_rect(tweak_data.gui.icons.list_btn_ico_shirt.texture_rect)
			-- change event handler
			self._button_type = RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION
		elseif button_type == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_AMERICAN then
			self._icon:set_image(tweak_data.gui.icons.list_btn_ico_shirt.texture)
			self._icon:set_texture_rect(tweak_data.gui.icons.list_btn_ico_shirt.texture_rect)
			self._label:set_text(self:translate("menu_american", true))
			self._button_type = RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_AMERICAN
		elseif button_type == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_BRITISH then
			self._icon:set_image(tweak_data.gui.icons.list_btn_ico_shirt.texture)
			self._icon:set_texture_rect(tweak_data.gui.icons.list_btn_ico_shirt.texture_rect)
			self._label:set_text(self:translate("menu_british", true))
			self._button_type = RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_BRITISH
		elseif button_type == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_RUSSIAN then
			self._icon:set_image(tweak_data.gui.icons.list_btn_ico_shirt.texture)
			self._icon:set_texture_rect(tweak_data.gui.icons.list_btn_ico_shirt.texture_rect)
			self._label:set_text(self:translate("menu_russian", true))
			self._button_type = RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_RUSSIAN
		elseif button_type == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_GERMAN then
			self._icon:set_image(tweak_data.gui.icons.list_btn_ico_shirt.texture)
			self._icon:set_texture_rect(tweak_data.gui.icons.list_btn_ico_shirt.texture_rect)
			self._label:set_text(self:translate("menu_german", true))
			self._button_type = RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_GERMAN
		end
	end
)
