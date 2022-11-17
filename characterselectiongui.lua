Hooks:PostHook(CharacterSelectionGui, "_layout", "better_change_nation_bigger_box", function(self)
	self._characters_list:set_w(1600)
end)

function CharacterSelectionGui:change_nation(selected_nation)
	self._new_nation = selected_nation
	
	managers.raid_menu:on_escape()
end

Hooks:PostHook(CharacterSelectionGui, "_character_action_callback", "better_change_nation_on_click", function(self, slot_index, action, params, button_self)
	if action == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION then
		if params.american then
			button_self:set_visible(false)
			params.rename_profile:set_visible(false)
			params.american:set_visible(true)
			params.british:set_visible(true)
			params.russian:set_visible(true)
			params.german:set_visible(true)
		end
	elseif action == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_AMERICAN then
		self:change_nation("american")
	elseif action == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_BRITISH then
		self:change_nation("british")
	elseif action == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_RUSSIAN then
		self:change_nation("russian")
	elseif action == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_GERMAN then
		self:change_nation("german")
	elseif action == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_RENAME_PROFILE then
		local cache = Global.savefile_manager.meta_data_list[slot_index].cache
		local profile_name = cache.PlayerManager.character_profile_name
		local params = {
			callback_yes = callback(self, self, "_callback_yes_function"),
			textbox_value = profile_name
		}

		managers.menu:show_character_create_dialog(params)
	end
end)

--managers.player:set_character_profile_name(character_profile_name)

function CharacterSelectionGui:_callback_yes_function(button, button_data, data)
	local new_profile_name = trim(data.input_field_text)

	if new_profile_name == "" then
		local params = {
			textbox_id = "dialog_err_empty_character_name"
		}
		managers.menu:show_err_character_name_dialog(params)
		return
	elseif character_name_exists(new_profile_name) then
		local params = {
			textbox_id = "dialog_err_duplicate_character_name"
		}
		managers.menu:show_err_character_name_dialog(params)
		return
	end

	self._new_profile_name = new_profile_name

	managers.raid_menu:on_escape()
end

Hooks:PostHook(CharacterSelectionGui, "_extra_character_setup", "better_change_nation_applying", function(self)
	local shouldSave = false
	if self._new_profile_name then
		managers.player:set_character_profile_name(self._new_profile_name)
		self._new_profile_name = nil
		shouldSave = true
	end
	if self._new_nation then
		managers.character_customization:reaply_character_criminal(self._new_nation)
		managers.player:set_character_profile_nation(self._new_nation)
		managers.blackmarket:set_preferred_character(self._new_nation, 1)
		self._new_nation = nil
		shouldSave = true
	end
	if shouldSave then managers.savefile:save_game(managers.savefile:get_save_progress_slot()) end
end)