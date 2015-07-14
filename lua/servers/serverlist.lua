--[[
		Created by Switchy
		www.switchyentertainments.co.uk if you'd like to contact me.
		Or try our teamspeak 3! switchyent.ts.nfoservers.com
		Thanks!
]]--


LastTime = 0

local SKINS = {}
SKINS.COLORS = {
				lightgrey = Color(131, 131, 131, 180),
				grey = Color(111, 111, 111, 180),
				lowWhite = Color(243, 243, 243, 180),
				goodBlack = Color(41, 41, 41, 230),
				}
function SKINS:DrawFrame(w, h)
	topHeight = 24
	local rounded = 4
	draw.RoundedBoxEx( rounded, 0, 0, w, topHeight, SKINS.COLORS.lightgrey, true, true, false, false )
	draw.RoundedBoxEx( rounded, 0, topHeight, w, h-topHeight, SKINS.COLORS.lightgrey, false, false, true, true )
	draw.RoundedBoxEx( rounded, 2, topHeight, w-4, h-topHeight-2, SKINS.COLORS.goodBlack, false, false, true, true )
	
	local QuadTable = {}
	QuadTable.texture = surface.GetTextureID( "gui/gradient" )
	QuadTable.color = Color( 10, 10, 10, 120 )
	QuadTable.x = 2
	QuadTable.y = topHeight
	QuadTable.w = w - 4
	QuadTable.h = h-topHeight-2
	draw.TexturedQuad( QuadTable )
end

function ThinkHook()
	LastTime = LastTime + 1
	if (string.sub(text, 1, 8) == "/servers") then
		local Player = LocalPlayer()
		local serversip = {"PUT-YOUR-SERVER-IP-HERE!", "COPY-THIS-FORMAT-TO-ADD-MORE"}
		local servers = {"PUT-YOUR-SERVER-NAME-HERE", "PUT-YOUR-SERVER-NAME-HERE"}
--[[The above corresponds with each other; so the first server name will be listed under the first IP you've listed. Example below.


								\/ BELOW links with this -------------------------------
		local serversip = {"0.0.0.0:00000", "0.0.0.0:00000"}							|
		local servers = {"This is my server", "This my second server"}					|
								^-------------------------------------------------------
		
Hopefully I made that clear enough.

]]--
			local w = 506
			local h = 512
		
			local f = vgui.Create("DFrame")
		f:SetSize( w, h )
		f:SetPos( (ScrW()/2) - (w/2), (ScrH()/2) - (h/2) )
		f:SetTitle("SwitchyEntertainments.co.uk | Server List")
		f:SetDraggable(true)
		f:ShowCloseButton(true)
		f:MakePopup()
		f.Paint = function()
		SKINS:DrawFrame(f:GetWide(), f:GetTall())
	end
		for i=1,table.getn(servers) do
			local Button = vgui.Create("DButton", f)
			Button:SetText(i..". "..servers[i])
			Button:SetPos(20, 20+50*i)
			Button:SetSize(465, 40)
			Button.DoClick = function()
				Player:ConCommand("connect "..serversip[i])
			end
		end
		LastTime = 0
	end
end

hook.Add( "Think", "ThinkHook", ThinkHook);