RaidGUIControlListItemCharacterSelect.SLOTS[3] = {x = 651, y = 0}
RaidGUIControlListItemCharacterSelect.SLOTS[4] = {x = 768, y = 0}
RaidGUIControlListItemCharacterSelect.SLOTS[5] = {x = 885, y = 0}
RaidGUIControlListItemCharacterSelect.SLOTS[6] = {x = 1002, y = 0}
RaidGUIControlListItemCharacterSelect.SLOTS[7] = {x = 1119, y = 0}

Hooks:PostHook(RaidGUIControlListItemCharacterSelect, "init", "better_change_nation_bigger_box_again", function(self, parent, params, item_data)
    self._object:set_w(1600)
end)

Hooks:PostHook(RaidGUIControlListItemCharacterSelect, "_load_data", "better_change_nation_buttons", function(self)
    if self._item_data.cache then
		local settings = {
			visible = false,
			h = 94, y = 0, w = 116, x = 651,
			special_action_callback = self.special_action_callback,
			slot_index = self._character_slot
		}

		--Rename profile button
		self._rename_profile = self._object:create_custom_control(RaidGUIControlListItemCharacterSelectButton, settings)
		self._rename_profile:set_button(RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_RENAME_PROFILE)
		self:_set_button_slot(self._rename_profile, 4)
		table.insert(self._special_action_buttons, self._rename_profile)

		--Rivet
        self._change_nation_american = self._object:create_custom_control(RaidGUIControlListItemCharacterSelectButton, settings)
		self._change_nation_american:set_button(RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_AMERICAN)
		self:_set_button_slot(self._change_nation_american, 3)
		table.insert(self._special_action_buttons, self._change_nation_american)

		--Sterling
        self._change_nation_british = self._object:create_custom_control(RaidGUIControlListItemCharacterSelectButton, settings)
		self._change_nation_british:set_button(RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_BRITISH)
		self:_set_button_slot(self._change_nation_british, 4)
		table.insert(self._special_action_buttons, self._change_nation_british)

		--Kurgan
        self._change_nation_russian = self._object:create_custom_control(RaidGUIControlListItemCharacterSelectButton, settings)
		self._change_nation_russian:set_button(RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_RUSSIAN)
		self:_set_button_slot(self._change_nation_russian, 5)
		table.insert(self._special_action_buttons, self._change_nation_russian)

		--Wolfgang
        self._change_nation_german = self._object:create_custom_control(RaidGUIControlListItemCharacterSelectButton, settings)
		self._change_nation_german:set_button(RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_GERMAN)
		self:_set_button_slot(self._change_nation_german, 6)
		table.insert(self._special_action_buttons, self._change_nation_german)

		--Change nation button
        self._change_nation = self._object:create_custom_control(RaidGUIControlListItemCharacterSelectButton, {
			visible = false,
			h = 94, y = 0, w = 116, x = 651,
			special_action_callback = self.special_action_callback,
			slot_index = self._character_slot,
			american = self._change_nation_american,
			british = self._change_nation_british,
			russian = self._change_nation_russian,
			german = self._change_nation_german,
			rename_profile = self._rename_profile
		})
		self._change_nation:set_button(RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION)
		self:_set_button_slot(self._change_nation, 3)
		table.insert(self._special_action_buttons, self._change_nation)
    end
end)

Hooks:PostHook(RaidGUIControlListItemCharacterSelect, "select", "better_change_nation_select", function(self, dont_trigger_selected_callback)
    if self._change_nation and self._active then
		self._change_nation:set_visible(true)
		self._rename_profile:set_visible(true)
		self._change_nation_american:set_visible(false)
		self._change_nation_british:set_visible(false)
		self._change_nation_russian:set_visible(false)
		self._change_nation_german:set_visible(false)
	end
end)

Hooks:PostHook(RaidGUIControlListItemCharacterSelect, "unselect", "better_change_nation_unselect", function(self)
    if self._change_nation and self._active then
		self._change_nation:set_visible(false)
		self._rename_profile:set_visible(false)
		self._change_nation_american:set_visible(false)
		self._change_nation_british:set_visible(false)
		self._change_nation_russian:set_visible(false)
		self._change_nation_german:set_visible(false)
	end
end)