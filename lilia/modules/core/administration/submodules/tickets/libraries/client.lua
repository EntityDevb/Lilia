﻿local xpos = xpos or 20
local ypos = ypos or 20
local xpos = xpos or 20
local ypos = ypos or 20
function MODULE:TicketFrame(requester, message, claimed)
    if not TicketFrames then TicketFrames = {} end
    local mat_lightning = Material("icon16/lightning_go.png")
    local mat_arrow = Material("icon16/arrow_left.png")
    local mat_link = Material("icon16/link.png")
    local mat_case = Material("icon16/briefcase.png")
    if not IsValid(requester) or not requester:IsPlayer() then return end
    for _, v in pairs(TicketFrames) do
        if v.idiot == requester then
            local txt = v:GetChildren()[5]
            txt:AppendText("\n" .. message)
            txt:GotoTextEnd()
            timer.Remove("ticketsystem-" .. requester:SteamID64())
            timer.Create("ticketsystem-" .. requester:SteamID64(), 60, 1, function() if IsValid(v) then v:Remove() end end)
            surface.PlaySound("ui/hint.wav")
            return
        end
    end

    local w, h = 300, 120
    local frm = vgui.Create("DFrame")
    frm:SetSize(w, h)
    frm:SetPos(xpos, ypos)
    frm.idiot = requester
    function frm:Paint(w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(10, 10, 10, 230))
    end

    frm.lblTitle:SetColor(Color(255, 255, 255))
    frm.lblTitle:SetFont("ticketsystem")
    frm.lblTitle:SetContentAlignment(7)
    if claimed and IsValid(claimed) and claimed:IsPlayer() then
        frm:SetTitle(requester:Nick() .. " - Claimed by " .. claimed:Nick())
        if claimed == LocalPlayer() then
            function frm:Paint(w, h)
                draw.RoundedBox(0, 0, 0, w, h, Color(10, 10, 10, 230))
                draw.RoundedBox(0, 2, 2, w - 4, 16, Color(38, 166, 91))
            end
        else
            function frm:Paint(w, h)
                draw.RoundedBox(0, 0, 0, w, h, Color(10, 10, 10, 230))
                draw.RoundedBox(0, 2, 2, w - 4, 16, Color(207, 0, 15))
            end
        end
    else
        frm:SetTitle(requester:Nick())
    end

    local msg = vgui.Create("RichText", frm)
    msg:SetPos(10, 30)
    msg:SetSize(190, h - 35)
    msg:SetContentAlignment(7)
    msg:SetVerticalScrollbarEnabled(false)
    function msg:PerformLayout()
        self:SetFontInternal("DermaDefault")
    end

    msg:AppendText(message)
    local function createButton(text, material, position, clickFunc, disabled)
        text = L(text)
        local btn = vgui.Create("DButton", frm)
        btn:SetPos(215, position)
        btn:SetSize(83, 18)
        btn:SetText("          " .. text)
        btn:SetColor(Color(255, 255, 255))
        btn:SetContentAlignment(4)
        btn.Disabled = disabled
        btn.DoClick = function() if not btn.Disabled then clickFunc() end end
        btn.Paint = function(self, w, h)
            if self.Depressed or self.m_bSelected then
                draw.RoundedBox(1, 0, 0, w, h, Color(255, 50, 50, 255))
            elseif self.Hovered and not self.Disabled then
                draw.RoundedBox(1, 0, 0, w, h, Color(205, 30, 30, 255))
            else
                draw.RoundedBox(1, 0, 0, w, h, self.Disabled and Color(100, 100, 100, 255) or Color(80, 80, 80, 255))
            end

            surface.SetDrawColor(Color(255, 255, 255))
            surface.SetMaterial(material)
            surface.DrawTexturedRect(5, 1, 16, 16)
        end

        if disabled then btn:SetTooltip("You cannot perform this action on your own ticket.") end
        return btn
    end

    local isLocalPlayer = requester == LocalPlayer()
    createButton("goto", mat_lightning, 20 * 1, function() RunConsoleCommand(sam and "sam" or ulx and "ulx", "goto", sam and requester:SteamID() or requester:SteamID()) end, isLocalPlayer)
    createButton("return", mat_arrow, 20 * 2, function() RunConsoleCommand(sam and "sam" or ulx and "ulx", "return", sam and requester:SteamID() or requester:SteamID()) end, isLocalPlayer)
    createButton("freeze", mat_link, 20 * 3, function() RunConsoleCommand(sam and "sam" or ulx and "ulx", "freeze", sam and requester:SteamID() or requester:SteamID()) end, isLocalPlayer)
    createButton("bring", mat_arrow, 20 * 4, function() RunConsoleCommand(sam and "sam" or ulx and "ulx", "bring", sam and requester:SteamID() or requester:SteamID()) end, isLocalPlayer)
    local shouldClose = false
    local claimButton
    claimButton = createButton("Claim case", mat_case, 20 * 5, function()
        if not shouldClose then
            if frm.lblTitle:GetText():lower():find("claimed") then
                chat.AddText(Color(255, 150, 0), "[ERROR] Case has already been claimed")
                surface.PlaySound("common/wpn_denyselect.wav")
            else
                net.Start("TicketSystemClaim")
                net.WriteEntity(requester)
                net.SendToServer()
                shouldClose = true
                claimButton:SetText("          Close case")
            end
        else
            net.Start("TicketSystemClose")
            net.WriteEntity(requester)
            net.SendToServer()
        end
    end, isLocalPlayer)

    local closeButton = vgui.Create("DButton", frm)
    closeButton:SetText("×")
    closeButton:SetTooltip("Close")
    closeButton:SetColor(Color(255, 255, 255))
    closeButton:SetPos(w - 18, 2)
    closeButton:SetSize(16, 16)
    function closeButton:Paint()
    end

    closeButton.DoClick = function() frm:Close() end
    frm:ShowCloseButton(false)
    frm:SetPos(xpos, ypos + 130 * #TicketFrames)
    frm:MoveTo(xpos, ypos + 130 * #TicketFrames, 0.2, 0, 1, function() surface.PlaySound("garrysmod/balloon_pop_cute.wav") end)
    function frm:OnRemove()
        if TicketFrames then
            table.RemoveByValue(TicketFrames, frm)
            for k, v in ipairs(TicketFrames) do
                v:MoveTo(xpos, ypos + 130 * (k - 1), 0.1, 0, 1, function() end)
            end
        end

        if IsValid(requester) and timer.Exists("ticketsystem-" .. requester:SteamID64()) then timer.Remove("ticketsystem-" .. requester:SteamID64()) end
    end

    table.insert(TicketFrames, frm)
    timer.Create("ticketsystem-" .. requester:SteamID64(), 60, 1, function() if IsValid(frm) then frm:Remove() end end)
end

function MODULE:LoadFonts(font)
    surface.CreateFont("ticketsystem", {
        font = font,
        size = 15,
        weight = 400
    })
end