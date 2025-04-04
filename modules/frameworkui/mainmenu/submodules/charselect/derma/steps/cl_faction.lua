﻿local PANEL = {}
function PANEL:Init()
	self.title = self:addLabel( "Select a faction" )
	self.faction = self:Add( "DComboBox" )
	self.faction:SetFont( "liaCharButtonFont" )
	self.faction:Dock( TOP )
	self.faction:DockMargin( 0, 4, 0, 0 )
	self.faction:SetTall( 40 )
	self.faction.Paint = function( faction, w, h )
		lia.util.drawBlur( faction )
		surface.SetDrawColor( 0, 0, 0, 100 )
		surface.DrawRect( 0, 0, w, h )
	end

	self.faction:SetTextColor( color_white )
	self.faction.OnSelect = function( _, _, _, id ) self:onFactionSelected( lia.faction.teams[ id ] ) end
	self.desc = self:addLabel( "desc" )
	self.desc:DockMargin( 0, 8, 0, 0 )
	self.desc:SetFont( "liaCharSubTitleFont" )
	self.desc:SetWrap( true )
	self.desc:SetAutoStretchVertical( true )
	self.skipFirstSelect = true
	local first = true
	for id, faction in SortedPairsByMemberValue( lia.faction.teams, "name" ) do
		if not lia.faction.hasWhitelist( faction.index ) then continue end
		self.faction:AddChoice( L( faction.name ), id, first )
		first = false
	end
end

function PANEL:onDisplay()
	self.skipFirstSelect = true
	local _, id = self.faction:GetSelected()
	local faction = lia.faction.teams[ id ]
	if faction then self:onFactionSelected( faction ) end
end

function PANEL:onFactionSelected( faction )
	if self:getContext( "faction" ) == faction.index then return end
	self.desc:SetText( L( faction.desc or "noDesc" ) )
	self:clearContext()
	self:setContext( "faction", faction.index )
	self:setContext( "model", 1 )
	self:updateModelPanel()
	if self.skipFirstSelect then
		self.skipFirstSelect = false
		return
	end

	lia.gui.character:clickSound()
end

function PANEL:shouldSkip()
	return #self.faction.Choices == 1
end

function PANEL:onSkip()
	local _, id = self.faction:GetSelected()
	local faction = lia.faction.teams[ id ]
	self:setContext( "faction", faction and faction.index or nil )
	self:setContext( "model", self:getContext( "model", 1 ) )
end

vgui.Register( "liaCharacterFaction", PANEL, "liaCharacterCreateStep" )
