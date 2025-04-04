﻿local MODULE = MODULE
MODULE.OOCBans = MODULE.OOCBans or {}
lia.command.add( "banooc", {
	adminOnly = true,
	privilege = "Ban OOC",
	syntax = "[string charname]",
	AdminStick = {
		Name = "Ban OOC",
		Category = "Moderation Tools",
		SubCategory = "OOC",
		Icon = "icon16/sound_mute.png"
	},
	onRun = function( client, arguments )
		local target = lia.command.findPlayer( client, arguments[ 1 ] )
		if not target or not IsValid( target ) then
			client:notifyLocalized( "noTarget" )
			return
		end

		MODULE.OOCBans[ target:SteamID64() ] = true
		client:notify( target:Name() .. " has been banned from OOC." )
	end
} )

lia.command.add( "unbanooc", {
	adminOnly = true,
	privilege = "Unban OOC",
	syntax = "[string charname]",
	AdminStick = {
		Name = "Unban OOC",
		Category = "Moderation Tools",
		SubCategory = "OOC",
		Icon = "icon16/sound.png"
	},
	onRun = function( client, arguments )
		local target = lia.command.findPlayer( client, arguments[ 1 ] )
		if not target or not IsValid( target ) then
			client:notifyLocalized( "noTarget" )
			return
		end

		MODULE.OOCBans[ target:SteamID64() ] = nil
		client:notify( target:Name() .. " has been unbanned from OOC." )
	end
} )

lia.command.add( "blockooc", {
	superAdminOnly = true,
	privilege = "Block OOC",
	syntax = "[string charname]",
	onRun = function( client )
		if GetGlobalBool( "oocblocked", false ) then
			SetGlobalBool( "oocblocked", false )
			client:notify( "Unlocked OOC!" )
		else
			SetGlobalBool( "oocblocked", true )
			client:notify( "Blocked OOC!" )
		end
	end
} )

lia.command.add( "refreshfonts", {
	superAdminOnly = true,
	privilege = "Refresh Fonts",
	onRun = function( client ) client:ConCommand( "refreshfonts" ) end
} )

lia.command.add( "clearchat", {
	adminOnly = true,
	privilege = "Clear Chat",
	onRun = function()
		for _, client in player.Iterator() do
			client:ConCommand( "fixchatplz" )
		end
	end
} )
