﻿netstream.Hook("cMsg", function(client, chatType, text, anonymous)
    if IsValid(client) then
        local class = lia.chat.classes[chatType]
        text = hook.Run("OnChatReceived", client, chatType, text, anonymous) or text
        if class then
            CHAT_CLASS = class
            class.onChatAdd(client, text, anonymous)
            if lia.config.get("CustomChatSound", "") and lia.config.get("CustomChatSound", "") ~= "" then
                surface.PlaySound(lia.config.get("CustomChatSound", ""))
            else
                chat.PlaySound()
            end

            CHAT_CLASS = nil
        end
    end
end)
