﻿--- Configuration for the Protection Module.
-- @configuration Protection
--- This table defines the default settings for the Protection Module.
-- @realm shared
-- @table Configuration
-- @field CarRagdoll Determines whether being hit by a car results in ragdolling | **boolean**
-- @field OnDamageCharacterSwitchCooldown Specifies whether cooldown on character switching is enabled after taking damage | **boolean**
-- @field OnDamageCharacterSwitchCooldownTimer Sets the cooldown duration (in seconds) on character switching after taking damage | **integer**
-- @field SwitchCooldownOnAllEntities Specifies whether damage cooldown applies to all entities or just humans. If false, it applies only to humans | **boolean**
-- @field CharacterSwitchCooldown Indicates whether a cooldown for character switching exists | **boolean**
-- @field CharacterSwitchCooldownTimer Sets the duration (in seconds) of the character switch cooldown | **integer**
-- @field NPCsDropWeapons Controls whether NPCs drop weapons upon death | **boolean**
-- @field TimeUntilDroppedSWEPRemoved Specifies the duration (in seconds) until a dropped SWEP is removed. This pertains to actual SWEPs, not weapon items | **integer**
-- @field BlockedCollideEntities Lists entities with collisions disabled | **table**
-- @field KnownExploits Lists known exploits that the protection module is aware of | **table**
-- @field HackCommands Lists commands available in the hack menu | **table**
-- @field HackGlobals Lists global variables accessible in the hack menu | **table**
-- @field BadCVars Lists undesirable console variables that should be monitored or blocked | **table**
-- @field ExploitableNetMessages Lists exploitable Net Messages that should be monitored or blocked | **table**
-- @field ActExploitTimer Specifies the duration (in seconds) a player remains unable to deal damage after using an "act" command | **integer**
-- @field AltsDisabled Whether or not alting is permitted | **boolean**
-- @field PassableOnFreeze Makes it so that props frozen can be passed through when frozen | **boolean**
-- @field CanNotPermaProp List of entities restricted from perma propping | **table**
-- @field DuplicatorBlackList List of entities blocked from the duplicator tool when used by regular players | **table**
-- @field RemoverBlockedEntities List of entities blocked from the remover tool when used by regular players | **table**
-- @field BlackListedProps List of props restricted from general spawn | **table**
-- @field RestrictedEnts List of entities blocked from physgun pick up and proprieties when used by regular players | **table**
-- @field RestrictedVehicles List of vehicles restricted from general spawn | **table**
-- @field PlayerSpawnVehicleDelay Delay for spawning a vehicle after the previous one | **integer**
-- @field ToolInterval ToolGun Usage Cooldown | **integer**
-- @field ButtonList List of button models to prevent button spamming exploits | **table**
-- @field DisableLuaRun Weather or not Lilia should prevent lua_run hooks on maps | **boolean**
