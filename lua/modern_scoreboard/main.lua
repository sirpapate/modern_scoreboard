local MSb = ModernScoreboard

print("askjlhqaskdlfhasfhdladshflk")
if CLIENT then

	MSb.Disabled = CreateClientConVar("msb_disable", "0", true, false)
	cvars.AddChangeCallback("msb_disable", function(name, old, new)
		if new == "1" then
			MSb.Disable()
		else
			if old == "1" then
				MSb.Init()
			end
		end
	end)

	function MSb.Create()
		if MSb.Scoreboard then
			MSb.Remove()
		end

		MSb.Scoreboard = vgui.CreateFromTable(MSb.VGUI.Main)
	end

	function MSb.Remove()
		MSb.Scoreboard:Remove()
	end

	function MSb.Show()

	end

	function MSb.Hide()

	end

	function MSb.Disable()
		local GM = GAMEMODE
		MSb.Remove()

		GM.ScoreboardShow = MSb.Old.Show
		GM.ScoreboardHide = MSb.Old.Hide
	end

	function MSb.Init()
		if MSb.Disabled:GetBool() then return end
		local GM = GAMEMODE

		if not MSb.Old then
			MSb.Old = {
				Show = GM.ScoreboardShow,
				Hide = GM.ScoreboardHide,
			}
		end

		MSb.Create()

		GM.ScoreboardShow = MSb.Show
		GM.ScoreboardHide = MSb.Hide

		if g_Scoreboard then
			g_Scoreboard:Remove()
		end
	end

	hook.Add("Initialize", "ModernScoreboard", MSb.Init)
end

