--------------------------------------------------------------------------------------------------------
lia.util.include("backend/libs/cl_fonts.lua")
--------------------------------------------------------------------------------------------------------
-- GAMEMODE THIRDPARTY LIBRARIES \\
lia.util.include("backend/external/thirdparty/cl_ikon.lua", "client")
lia.util.include("backend/external/thirdparty/cl_markup.lua", "client")
lia.util.include("backend/external/thirdparty/cl_surfaceGetURL.lua", "client")
lia.util.include("backend/external/thirdparty/sh_deferred.lua", "shared")
lia.util.include("backend/external/thirdparty/sh_ease.lua", "shared")
lia.util.include("backend/external/thirdparty/sh_netstream2.lua", "shared")
lia.util.include("backend/external/thirdparty/sh_pon.lua", "shared")
lia.util.include("backend/external/thirdparty/sh_utf8.lua", "shared")
--------------------------------------------------------------------------------------------------------
-- GAMEMODE CONFIG \\
lia.util.include("config/sh_core.lua")
lia.util.include("config/sh_default.lua")
lia.util.include("config/sh_miscellaneous.lua")
lia.util.include("config/sh_models.lua")
lia.util.include("config/sh_perfomance.lua")
lia.util.include("config/sh_permissions.lua")
lia.util.include("config/sh_protection.lua")
lia.util.include("config/sh_toolpermissions.lua")
--------------------------------------------------------------------------------------------------------
-- GAMEMODE LIBRARIES \\
lia.util.include("backend/libs/cl_buttons.lua")
lia.util.include("backend/libs/networking/sh_networking.lua")
lia.util.include("backend/libs/networking/sv_networking.lua")
lia.util.include("backend/libs/networking/cl_networking.lua")
lia.util.include("backend/libs/util/sh_util.lua")
lia.util.include("backend/libs/util/sv_util.lua")
lia.util.include("backend/libs/util/cl_util.lua")
lia.util.include("backend/libs/character/sh_character.lua")
lia.util.include("backend/libs/character/sv_character.lua")
lia.util.include("backend/meta/character/sh_charactermeta.lua")
lia.util.include("backend/meta/character/sv_charactermeta.lua")
lia.util.include("backend/meta/player/sh_playermeta.lua")
lia.util.include("backend/meta/player/sv_playermeta.lua")
lia.util.include("backend/meta/player/cl_playermeta.lua")
lia.util.include("backend/libs/chatbox/sh_chatbox.lua")
lia.util.include("backend/libs/chatbox/sv_chatbox.lua")
lia.util.include("backend/libs/commands/sh_commands.lua")
lia.util.include("backend/libs/commands/sv_commands.lua")
lia.util.include("backend/libs/faction/sh_faction.lua")
lia.util.include("backend/libs/faction/cl_faction.lua")
lia.util.include("backend/libs/flag/sh_flag.lua")
lia.util.include("backend/libs/flag/sv_flag.lua")
lia.util.include("backend/libs/inventory/sh_inventory.lua")
lia.util.include("backend/libs/inventory/sv_inventory.lua")
lia.util.include("backend/libs/inventory/cl_inventory.lua")
lia.util.include("backend/meta/inventory/sh_inventory.lua")
lia.util.include("backend/meta/inventory/sv_inventory.lua")
lia.util.include("backend/meta/inventory/cl_inventory.lua")
lia.util.include("backend/meta/item/sh_itemmeta.lua")
lia.util.include("backend/meta/item/sv_itemmeta.lua")
lia.util.include("backend/meta/item/cl_itemmeta.lua")
lia.util.include("backend/libs/item/sh_item.lua")
lia.util.include("backend/libs/item/sv_item.lua")
lia.util.include("backend/libs/language/sh_language.lua")
lia.util.include("backend/libs/language/sv_language.lua")
lia.util.include("backend/meta/entity/sh_entitymeta.lua")
lia.util.include("backend/meta/entity/sv_entitymeta.lua")
lia.util.include("backend/meta/entity/cl_entitymeta.lua")
lia.util.include("backend/libs/cl_bar.lua")
lia.util.include("backend/libs/cl_menu.lua")
lia.util.include("backend/libs/cl_notice.lua")
lia.util.include("backend/libs/cl_playerinteract.lua")
lia.util.include("backend/libs/sh_anims.lua")
lia.util.include("backend/libs/sh_class.lua")
lia.util.include("backend/libs/sh_currency.lua")
lia.util.include("backend/libs/sh_perfomance.lua")
lia.util.include("backend/libs/sh_date.lua")
lia.util.include("backend/libs/sh_module.lua")
lia.util.include("backend/libs/language/cl_language.lua")
lia.lang.loadFromDir("languages")
lia.item.loadFromDir("items")
--------------------------------------------------------------------------------------------------------
-- GAMEMODE FUNCTIONS \\
lia.util.include("backend/core/cl_initialization.lua")
lia.util.include("backend/core/hooks/sv_hooks.lua")
lia.util.include("backend/core/sv_misc.lua")
lia.util.include("backend/core/sv_iteminteract.lua")
lia.util.include("backend/core/sv_spawns.lua")
lia.util.include("backend/core/sv_bots.lua")
lia.util.include("backend/core/cl_panels.lua")
lia.util.include("backend/core/cl_visual.lua")
lia.util.include("backend/core/hooks/cl_hooks.lua")
lia.util.include("backend/core/cl_loadingscreen.lua")
lia.util.include("backend/core/sv_permissions.lua")
lia.util.include("backend/core/sh_misc.lua")
lia.util.include("backend/core/sv_nostuck.lua")
lia.util.include("backend/core/sv_protection.lua")
lia.util.include("backend/core/hooks/sh_hooks.lua")
lia.util.include("backend/core/cl_crosshair.lua")
lia.util.include("backend/libs/netlogging/cl_netmessagelogger.lua")
lia.util.include("backend/libs/netlogging/sv_netmessagelogger.lua")
lia.util.include("backend/libs/sh_attributes.lua")
lia.util.include("frontend/attributes/cl_attribute_ui.lua")
lia.util.include("frontend/attributes/cl_attributes.lua")
lia.util.include("frontend/death/cl_death.lua")
--------------------------------------------------------------------------------------------------------
-- GAMEMODE NETMESSAGES \\
lia.util.include("backend/netcalls/cl_netcalls.lua")
lia.util.include("backend/netcalls/sv_netcalls.lua")
--------------------------------------------------------------------------------------------------------
-- GAMEMODE VISUALS \\
lia.util.include("frontend/chatbox/cl_chatbox.lua")
lia.util.include("frontend/chatbox/cl_markup.lua")
--------------------------------------------------------------------------------------------------------
lia.util.include("frontend/f1menu/cl_classes.lua")
lia.util.include("frontend/f1menu/cl_helps.lua")
lia.util.include("frontend/f1menu/cl_hooks.lua")
lia.util.include("frontend/f1menu/cl_information.lua")
lia.util.include("frontend/f1menu/cl_menu.lua")
lia.util.include("frontend/f1menu/cl_menubutton.lua")
lia.util.include("frontend/f1menu/cl_menuoptions.lua")
--------------------------------------------------------------------------------------------------------
lia.util.include("frontend/hud/cl_bars.lua")
lia.util.include("frontend/hud/cl_hooks.lua")
lia.util.include("frontend/hud/cl_vignette.lua")
--------------------------------------------------------------------------------------------------------
lia.util.include("frontend/inventory/cl_grid_inventory_item.lua")
lia.util.include("frontend/inventory/cl_grid_inventory_panel.lua")
lia.util.include("frontend/inventory/cl_grid_inventory.lua")
lia.util.include("frontend/inventory/cl_hooks.lua")
lia.util.include("frontend/inventory/cl_inventory.lua")
lia.util.include("frontend/inventory/cl_invpanel_extensions.lua")
lia.util.include("frontend/inventory/sh_grid_inv.lua")
lia.util.include("frontend/inventory/sv_hooks.lua")
--------------------------------------------------------------------------------------------------------
lia.util.include("frontend/misc/cl_horizontal_scroll_bar.lua")
lia.util.include("frontend/misc/cl_horizontal_scroll.lua")
lia.util.include("frontend/misc/cl_modelpanel.lua")
lia.util.include("frontend/misc/cl_notice.lua")
lia.util.include("frontend/misc/cl_quick.lua")
lia.util.include("frontend/misc/cl_spawnicon.lua")
lia.util.include("frontend/misc/cl_tooltip.lua")
--------------------------------------------------------------------------------------------------------
lia.util.include("frontend/theme/cl_skin.lua")
lia.util.include("frontend/theme/cl_skindark.lua")
lia.util.include("frontend/theme/cl_theme.lua")
--------------------------------------------------------------------------------------------------------
lia.util.include("frontend/thirdperson/cl_conconsole.lua")
lia.util.include("frontend/thirdperson/cl_hooks.lua")
lia.util.include("frontend/thirdperson/cl_panel.lua")
--------------------------------------------------------------------------------------------------------
lia.util.include("frontend/weaponselector/cl_enable.lua")
lia.util.include("frontend/weaponselector/cl_hooks.lua")
--------------------------------------------------------------------------------------------------------
-- GAMEMODE MISC \\
lia.util.include("frontend/cl_hooks.lua")
lia.util.include("frontend/cl_voicepanel.lua")
--------------------------------------------------------------------------------------------------------
lia.util.include("commands/cl_adminstration.lua")
lia.util.include("commands/cl_cleaners.lua")
lia.util.include("commands/cl_management.lua")
lia.util.include("commands/cl_misc.lua")
lia.util.include("commands/cl_player.lua")
lia.util.include("commands/sv_adminstration.lua")
lia.util.include("commands/sv_cleaners.lua")
lia.util.include("commands/sv_management.lua")
lia.util.include("commands/sv_misc.lua")
lia.util.include("commands/sv_player.lua")