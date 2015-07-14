--[[
		Created by Switchy
		www.switchyentertainments.co.uk if you'd like to contact me.
		Or try our teamspeak 3! ts.switchyentertainments.co.uk:12650
		Thanks!
]]--

if SERVER then
	AddCSLuaFile("autorun/servers.lua")
	AddCSLuaFile("servers/serverlist.lua")
end

if CLIENT then
	include("servers/serverlist.lua")
end