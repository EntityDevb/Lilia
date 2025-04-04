﻿local MODULE = MODULE
local PANEL = {}
local EDITOR = include( MODULE.path .. "/libs/cl_vendor.lua" )
local function onFactionStateChanged( checkBox, state )
	EDITOR.faction( checkBox.factionID, state )
end

local function onClassStateChanged( checkBox, state )
	EDITOR.class( checkBox.classID, state )
end

function PANEL:Init()
	if IsValid( lia.gui.vendorFactionEditor ) then lia.gui.vendorFactionEditor:Remove() end
	lia.gui.vendorFactionEditor = self
	self:SetSize( 256, 360 )
	self:Center()
	self:MakePopup()
	self:SetTitle( L( "vendorFaction" ) )
	self.scroll = self:Add( "DScrollPanel" )
	self.scroll:Dock( FILL )
	self.scroll:DockPadding( 0, 0, 0, 4 )
	self.factions = {}
	self.classes = {}
	for k, v in ipairs( lia.faction.indices ) do
		local panel = self.scroll:Add( "DPanel" )
		panel:Dock( TOP )
		panel:DockPadding( 4, 4, 4, 4 )
		panel:DockMargin( 0, 0, 0, 4 )
		local faction = panel:Add( "DCheckBoxLabel" )
		faction:Dock( TOP )
		faction:SetTextColor( color_white )
		faction:SetText( L( v.name ) )
		faction:DockMargin( 0, 0, 0, 4 )
		faction.factionID = k
		faction.OnChange = onFactionStateChanged
		self.factions[ k ] = faction
		for k2, v2 in ipairs( lia.class.list ) do
			if v2.faction == k then
				local class = panel:Add( "DCheckBoxLabel" )
				class:Dock( TOP )
				class:DockMargin( 16, 0, 0, 4 )
				class:SetText( L( v2.name ) )
				class:SetTextColor( color_white )
				class.classID = k2
				class.factionID = faction.factionID
				class.OnChange = onClassStateChanged
				self.classes[ k2 ] = class
				panel:SetTall( panel:GetTall() + class:GetTall() + 4 )
			end
		end
	end

	self:updateChecked()
	hook.Add( "VendorFactionUpdated", self, self.updateChecked )
	hook.Add( "VendorClassUpdated", self, self.updateChecked )
end

function PANEL:updateChecked()
	local entity = liaVendorEnt
	for id, panel in pairs( self.factions ) do
		panel:SetChecked( entity:isFactionAllowed( id ) )
	end

	for id, panel in pairs( self.classes ) do
		panel:SetChecked( entity:isClassAllowed( id ) )
	end
end

vgui.Register( "VendorFactionEditor", PANEL, "DFrame" )
