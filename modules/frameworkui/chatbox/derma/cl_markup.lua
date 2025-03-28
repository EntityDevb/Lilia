﻿local PANEL = {}
function PANEL:Init()
	self:SetPaintBackground( false )
end

function PANEL:setMarkup( text, onDrawText )
	local object = lia.markup.parse( text, self:GetWide() )
	object.onDrawText = onDrawText
	self:SetTall( object:getHeight() )
	self.Paint = function() object:draw( 0, 0 ) end
end

vgui.Register( "liaMarkupPanel", PANEL, "DPanel" )
