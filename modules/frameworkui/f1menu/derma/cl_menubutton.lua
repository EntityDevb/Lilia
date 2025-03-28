﻿local PANEL = {}
local MenuButtonRollover = "ui/buttonrollover.wav"
local SoundMenuButtonPressed = "ui/buttonclickrelease.wav"
function PANEL:Init()
	self:SetFont( "liaMenuButtonFont" )
	self:SetExpensiveShadow( 2, Color( 0, 0, 0, 200 ) )
	self:SetTextColor( color_white )
	self:SetPaintBackground( false )
	self.OldSetTextColor = self.SetTextColor
	self.SetTextColor = function( this, color )
		this:OldSetTextColor( color )
		this:SetFGColor( color )
	end
end

function PANEL:setText( text, noTranslation )
	surface.SetFont( "liaMenuButtonFont" )
	self:SetText( noTranslation and text:upper() or L( text ):upper() )
	if not noTranslation then self:SetTooltip( L( text .. "Tip" ) ) end
	local w, h = surface.GetTextSize( self:GetText() )
	self:SetSize( w + 64, h + 32 )
end

function PANEL:OnCursorEntered()
	local color = self:GetTextColor()
	self:SetTextColor( Color( math.max( color.r - 25, 0 ), math.max( color.g - 25, 0 ), math.max( color.b - 25, 0 ) ) )
	surface.PlaySound( MenuButtonRollover )
end

function PANEL:OnCursorExited()
	if self.color then
		self:SetTextColor( self.color )
	else
		self:SetTextColor( color_white )
	end
end

function PANEL:OnMousePressed( code )
	if self.color then
		self:SetTextColor( self.color )
	else
		self:SetTextColor( lia.config.get( "Color" ) )
	end

	surface.PlaySound( SoundMenuButtonPressed )
	if code == MOUSE_LEFT and self.DoClick then self:DoClick( self ) end
end

function PANEL:OnMouseReleased()
	if self.color then
		self:SetTextColor( self.color )
	else
		self:SetTextColor( color_white )
	end
end

vgui.Register( "liaMenuButton", PANEL, "DButton" )
