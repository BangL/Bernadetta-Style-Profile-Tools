-- restore pre-U21 button positioning
RaidGUIControlListItemCharacterSelect.SLOTS[1] = { x = 417, y = 0 }
RaidGUIControlListItemCharacterSelect.SLOTS[2] = { x = 534, y = 0 }
RaidGUIControlListItemCharacterSelect.SLOTS[3] = { x = 651, y = 0 }
RaidGUIControlListItemCharacterSelect.SLOTS[4] = { x = 768, y = 0 }
RaidGUIControlListItemCharacterSelect.SLOTS[5] = { x = 885, y = 0 }
RaidGUIControlListItemCharacterSelect.SLOTS[6] = { x = 1002, y = 0 }

Hooks:PostHook(RaidGUIControlListItemCharacterSelect, "init",
	"bernadettaprofile_RaidGUIControlListItemCharacterSelectinit",
	function(self, parent, params, item_data)
		self._object:set_w(1600)
	end
)

Hooks:PostHook(RaidGUIControlListItemCharacterSelect, "_load_data",
	"bernadettaprofile_RaidGUIControlListItemCharacterSelect_load_data",
	function(self)
		if self._item_data.cache then
			local settings = {
				visible = false,
				h = 94,
				y = 0,
				w = 116,
				x = 651,
				special_action_callback = self.special_action_callback,
				slot_index = self._character_slot,
				list_item = self
			}

			--Rivet
			self._change_nation_american = self._object:create_custom_control(
				RaidGUIControlListItemCharacterSelectButton, settings
			)
			self._change_nation_american:set_button(
				RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_AMERICAN
			)
			self:_set_button_slot(self._change_nation_american, 3)
			table.insert(self._special_action_buttons, self._change_nation_american)

			--Sterling
			self._change_nation_british = self._object:create_custom_control(
				RaidGUIControlListItemCharacterSelectButton, settings
			)
			self._change_nation_british:set_button(
				RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_BRITISH
			)
			self:_set_button_slot(self._change_nation_british, 4)
			table.insert(self._special_action_buttons, self._change_nation_british)

			--Kurgan
			self._change_nation_russian = self._object:create_custom_control(
				RaidGUIControlListItemCharacterSelectButton, settings
			)
			self._change_nation_russian:set_button(
				RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_RUSSIAN
			)
			self:_set_button_slot(self._change_nation_russian, 5)
			table.insert(self._special_action_buttons, self._change_nation_russian)

			--Wolfgang
			self._change_nation_german = self._object:create_custom_control(
				RaidGUIControlListItemCharacterSelectButton, settings
			)
			self._change_nation_german:set_button(
				RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION_GERMAN
			)
			self:_set_button_slot(self._change_nation_german, 6)
			table.insert(self._special_action_buttons, self._change_nation_german)

			--Change nation button
			self._nationality_button._params.american = self._change_nation_american
			self._nationality_button._params.british = self._change_nation_british
			self._nationality_button._params.russian = self._change_nation_russian
			self._nationality_button._params.german = self._change_nation_german
			self._nationality_button._params.rename_profile = self._rename_button
			self._nationality_button:set_button(
				RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CHANGE_NATION -- restore pre-U21 style icon & event handler
			)
			self:_set_button_slot(self._nationality_button, 3) -- restore pre-U21 positioning
		end
	end
)

Hooks:PostHook(RaidGUIControlListItemCharacterSelect, "select",
	"bernadettaprofile_RaidGUIControlListItemCharacterSelectselect",
	function(self, dont_trigger_selected_callback)
		if self._change_nation_german and self._active then
			self._change_nation_american:set_visible(false)
			self._change_nation_british:set_visible(false)
			self._change_nation_russian:set_visible(false)
			self._change_nation_german:set_visible(false)
		end
	end
)

Hooks:PostHook(RaidGUIControlListItemCharacterSelect, "unselect",
	"bernadettaprofile_RaidGUIControlListItemCharacterSelectunselect",
	function(self)
		if self._change_nation_german and self._active then
			self._change_nation_american:set_visible(false)
			self._change_nation_british:set_visible(false)
			self._change_nation_russian:set_visible(false)
			self._change_nation_german:set_visible(false)
		end
	end
)
