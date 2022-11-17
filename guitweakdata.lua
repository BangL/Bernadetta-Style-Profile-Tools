Hooks:PostHook(GuiTweakData, "_setup_icons", "better_change_nation_icons", function(self)
	self.icons.change_nation_icon = {
		texture = "ui/atlas/change_nation_icon",
		texture_rect = {
			0,
			0,
			31,
			30
		}
	}
	self.icons.rename_profile_icon = {
		texture = "ui/atlas/rename_profile_icon",
		texture_rect = {
			0,
			0,
			31,
			30
		}
	}
end)