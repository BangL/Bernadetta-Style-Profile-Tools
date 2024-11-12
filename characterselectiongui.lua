-- restore pre-U21 button sizes
CharacterSelectionGui.BUTTON_H = 94
CharacterSelectionGui.BUTTON_W = 116

Hooks:PostHook(CharacterSelectionGui, "_layout",
	"bernadettaprofile_CharacterSelectionGui_layout",
	function(self)
		self._characters_list:set_w(1600)
	end
)

Hooks:PostHook(CharacterSelectionGui, "_character_action_callback",
	"bernadettaprofile_CharacterSelectionGui_character_action_callback",
	function(self, slot_index, action, params, button_self)
		local change_nationality = nil
		if action == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION then
			-- replaces the 'rather meh' U21 cycle-behaviour
			if params.american then
				button_self:set_visible(false)
				params.rename_profile:set_visible(false)
				params.american:set_visible(true)
				params.british:set_visible(true)
				params.russian:set_visible(true)
				params.german:set_visible(true)
			end
		elseif action == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_AMERICAN then
			change_nationality = "american"
		elseif action == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_BRITISH then
			change_nationality = "british"
		elseif action == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_RUSSIAN then
			change_nationality = "russian"
		elseif action == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_GERMAN then
			change_nationality = "german"
		end
		if change_nationality then
			self._new_nationality = change_nationality
			managers.raid_menu:on_escape()
		end
	end
)
