DB:create_entry("texture", "ui/atlas/change_nation_icon", ModPath .. "assets/change_nation_icon.dds")
DB:create_entry("texture", "ui/atlas/rename_profile_icon", ModPath .. "assets/rename_profile_icon.dds")

RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION = "change_nation"
RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_AMERICAN = "change_nation_american"
RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_BRITISH = "change_nation_british"
RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_RUSSIAN = "change_nation_russian"
RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_GERMAN = "change_nation_german"

RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_RENAME_PROFILE = "rename_profile"

function RaidGUIControlListItemCharacterSelectButton:on_mouse_released()
	if self._special_action_callback then
		self._special_action_callback(self._params.slot_index, self._button_type, self._params, self)

		return true
	end
end

Hooks:PostHook(RaidGUIControlListItemCharacterSelectButton, "set_button", "better_change_nation_button", function(self, button_type)
	if button_type == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION then
		self._icon:set_image(tweak_data.gui.icons.change_nation_icon.texture)
		self._icon:set_texture_rect(tweak_data.gui.icons.change_nation_icon.texture_rect)
		self._label:set_text(self:translate("bernadetta_profile_tools_character", true))
		self._button_type = RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION
	elseif button_type == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_AMERICAN then
		self._icon:set_image(tweak_data.gui.icons.change_nation_icon.texture)
		self._icon:set_texture_rect(tweak_data.gui.icons.change_nation_icon.texture_rect)
		self._label:set_text(self:translate("menu_american", true))
		self._button_type = RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_AMERICAN
	elseif button_type == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_BRITISH then
		self._icon:set_image(tweak_data.gui.icons.change_nation_icon.texture)
		self._icon:set_texture_rect(tweak_data.gui.icons.change_nation_icon.texture_rect)
		self._label:set_text(self:translate("menu_british", true))
		self._button_type = RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_BRITISH
	elseif button_type == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_RUSSIAN then
		self._icon:set_image(tweak_data.gui.icons.change_nation_icon.texture)
		self._icon:set_texture_rect(tweak_data.gui.icons.change_nation_icon.texture_rect)
		self._label:set_text(self:translate("menu_russian", true))
		self._button_type = RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_RUSSIAN
	elseif button_type == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_GERMAN then
		self._icon:set_image(tweak_data.gui.icons.change_nation_icon.texture)
		self._icon:set_texture_rect(tweak_data.gui.icons.change_nation_icon.texture_rect)
		self._label:set_text(self:translate("menu_german", true))
		self._button_type = RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_GERMAN
	elseif button_type == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_RENAME_PROFILE then
		self._icon:set_image(tweak_data.gui.icons.rename_profile_icon.texture)
		self._icon:set_texture_rect(tweak_data.gui.icons.rename_profile_icon.texture_rect)
		self._label:set_text(self:translate("bernadetta_profile_tools_rename", true))
		self._button_type = RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_RENAME_PROFILE
	end
end)