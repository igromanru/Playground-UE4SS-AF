--[[
    Author: Igromanru
    Date: 19.08.2024
    Mod Name: My Playground
]]

------------------------------
-- Don't change code below --
------------------------------
local AFUtils = require("AFUtils.AFUtils")
require("AFUtils.AFUtilsDebug")
require("AFUtils.BaseUtils.LinearColors")

local UEHelpers = require("UEHelpers")

ModName = "Playground"
ModVersion = "1.0.0"
DebugMode = true

LogInfo("Starting mod initialization")

local function LeyakTest()
    local aiDirector = AFUtils.GetAIDirector()
    if aiDirector then
        LogDebug("-- Abiotic_AIDirector_C:")

        -- aiDirector.LeyakCooldown = 10 * 60.0

        AFUtils.LogAIDirector(aiDirector)
        if aiDirector.ActiveLeyak:IsValid() and not IsEmptyVector(aiDirector.ActiveLeyak:K2_GetActorLocation()) then
            LogDebug("-- ActiveLeyak:")
            AFUtils.LogNPCLeyak(aiDirector.ActiveLeyak)
            
            -- aiDirector.ActiveLeyak:DropEssence()
        else
            -- local spawnDistanceInM = 20
            -- local playerController = GetMyPlayerController()
            -- if playerController and playerController.PlayerCameraManager:IsValid() then
            --     local cameraManager = playerController.PlayerCameraManager
            --     local lookDirection = cameraManager:GetActorForwardVector()
            --     local lookDirOffset = GetKismetMathLibrary():Multiply_VectorFloat(lookDirection, MToUnits(spawnDistanceInM))
            --     local spawnLocation = GetKismetMathLibrary():Add_VectorVector(cameraManager:GetCameraLocation(), lookDirOffset)
            --     aiDirector:SpawnLeyak(VectorToTable(spawnLocation));
            -- end
        end
    else
        LogDebug("No Abiotic_AIDirector_C found")
    end
    local aiControllerLeyak = AFUtils.GetAIControllerLeyak()
    if aiControllerLeyak and aiControllerLeyak:IsValid() then
        LogDebug("-- AI_Controller_Leyak_C:")
        AFUtils.LogAIControllerLeyak(aiControllerLeyak)
        -- aiControllerLeyak.WantsToDespawn = true
    else
        LogDebug("No AI_Controller_Leyak_C found")
    end
end

local function LogRecoilStuff(myPlayer)
    LogDebug("AimRecoilAdditive: "..myPlayer.AimRecoilAdditive)
    LogDebug("ControllerRecoilTimeline_NewTrack: "..myPlayer.ControllerRecoilTimeline_NewTrack_0_AFC3F42148DFC42265088DA509116D45)
    AFUtils.LogTimelineComponent(myPlayer.ControllerRecoilTimeline, "ControllerRecoilTimeline.")
    LogDebug("RecoilTimeline_NewTrack: "..myPlayer.RecoilTimeline_NewTrack_0_7619EC7841CCE2A53A63A7841FB4C01D)
    LogDebug("RecoilTimeline__Direction (enum 0-1): "..myPlayer.RecoilTimeline__Direction_7619EC7841CCE2A53A63A7841FB4C01D)
    AFUtils.LogTimelineComponent(myPlayer.RecoilTimeline, "RecoilTimeline.")
    LogDebug("SwayTimelineLoop_NewTrack: "..VectorToString(myPlayer.SwayTimelineLoop_NewTrack_1_1E19F0E74CE5FFB6096EBC86C262A1F2))
    AFUtils.LogTimelineComponent(myPlayer.SwayTimelineLoop, "SwayTimelineLoop.")
    LogDebug("BaseGunSway_Multiplier: "..myPlayer.BaseGunSway_Multiplier)
    LogDebug("CurrentGunSway_Speed: "..myPlayer.CurrentGunSway_Speed)
    LogDebug("CrosshairCenterNoSway: "..tostring(myPlayer.CrosshairCenterNoSway))
    LogDebug("ScopeSwayTime: "..myPlayer.ScopeSwayTime)
    LogDebug("ScopeSwaySpeed: "..myPlayer.ScopeSwaySpeed)
    LogDebug("BulletSpread_Base: "..myPlayer.BulletSpread_Base)
end

RegisterKeyBind(Key.L, function()
    ExecuteInGameThread(function()
        LogDebug("------------ L ---------------")
        -- local gameInstance = UEHelpers.GetGameInstance() ---@cast gameInstance UAbiotic_GameInstance_C
        -- if IsValid(gameInstance) then
        --     LogDebug("bCanPlayOnline:", gameInstance.bCanPlayOnline)
        --     LogDebug("bIsSoloOrLanPlayOnly:", gameInstance.bIsSoloOrLanPlayOnly)
        --     LogDebug("IsSingleplayer:", gameInstance.IsSingleplayer)
        -- end

        -- local players = FindAllOf("Abiotic_PlayerCharacter_C") ---@type AAbiotic_PlayerCharacter_C[]?
        -- if players and #players > 0 then
        --     for i = 1, #players do
        --         local player = players[i]
        --         LogDebug(i ..": Faction:", player.Faction)
        --         -- if IsValid(player.OutlineComponent) then
        --         --     AFUtils.LogOutlineComponent(player.OutlineComponent, i .. ": OutlineComponent.")
        --         --     player.OutlineComponent.OutlineMask = AFUtils.OutlineMask.White
        --         --     player.OutlineComponent:UpdateHighlightedComponents()
        --         -- end
        --     end
        -- end

        -- local npcs = FindAllOf("NPC_Base_ParentBP_C") ---@type ANPC_Base_ParentBP_C[]?
        -- if npcs and #npcs > 0 then
        --     for i, npc in ipairs(npcs) do
        --         LogDebug(i ..": Class:", npc:GetClass():GetFullName())
        --         LogDebug(i ..": IsDisabled:", npc.IsDisabled)
        --         LogDebug(i ..": Faction:", npc.Faction)
        --         if IsValid(npc.OutlineComponent) then
        --             AFUtils.LogOutlineComponent(npc.OutlineComponent, i .. ": OutlineComponent.")
        --             npc.OutlineComponent.OutlineMask = AFUtils.OutlineMask.White
        --             npc.OutlineComponent:UpdateHighlightedComponents()
        --         end
        --     end
        -- end

        -- local gameState = AFUtils.GetSurvivalGameState()
        -- if IsValid(gameState) then
        --     LogDebug("PlayerCharacterInGame count:", #gameState.PlayerCharacterInGame)
        --     LogDebug("AlivePlayerCharacters count:", #gameState.AlivePlayerCharacters)
        -- end

        -- local leyakContainment = FindFirstOf("Deployed_LeyakContainment_C") ---@cast leyakContainment ADeployed_LeyakContainment_C
        -- if leyakContainment:IsValid() then
        --     -- leyakContainment:TrapLeyak(0.5)
        --     -- leyakContainment["Free Leyak"]()
        --     -- leyakContainment:ServerUpdateStabilityLevel(50)
        --     -- leyakContainment:ProduceLeyakEssence()
        --     AFUtils.LogDeployedLeyakContainment(leyakContainment, "LeyakContainment.")
        --     -- AFUtils.LogFurnitureParentBP(leyakContainment, "LeyakContainment.")
        --     -- AFUtils.LogDeployedParentBP(leyakContainment, "LeyakContainment.")
        -- end
        
        -- local myCharacterSave = AFUtils.GetMyPendingCharacterSave()
        -- if IsValid(myCharacterSave) then
        --     LogDebug("SaveIdentifier:", myCharacterSave.SaveIdentifier:ToString())
        --     LogDebug("SaveVersion:", myCharacterSave.SaveVersion)
        --     local traits = myCharacterSave.CharacterSaveData.Traits_15_0039F2B34D2A43327122E9960B328E55

        --     -- local newTrait = UEHelpers.FindFName("Trait_Moist")
        --     -- if newTrait ~= NAME_None then
        --     --     -- traits[#traits + 1] = newTrait
        --     --     traits[#traits] = newTrait
        --     -- end

        --     -- local gameInstance = AFUtils.GetGameInstance()
        --     -- if IsValid(gameInstance) then
        --     --     gameInstance:AddPlayerSaveToQueue(myCharacterSave)
        --     --     LogDebug("Added save to queue")
        --     -- end

        --     LogDebug("Traits:", #traits)
        --     LogDebug("Traits Max:", traits:GetArrayMax())
        --     for i = 1, #traits do
        --         local trait = traits[i]
        --         LogDebug(i .. ": ", trait:ToString())
        --     end
        -- end

        -- local gameInstance = UEHelpers.GetGameInstance() ---@cast gameInstance UAbiotic_GameInstance_C
        -- if IsValid(gameInstance) then
        --     LogDebug("PendingPlayerSaves:", #gameInstance.PendingPlayerSaves)
        --     for i = 1, #gameInstance.PendingPlayerSaves, 1 do
        --         local playerSave = gameInstance.PendingPlayerSaves[i]
        --         LogDebug(i .. ": Class:", playerSave:GetClass():GetFullName())
        --     end
        -- end

        -- LogDebug("IsServer:", IsServer())
        -- LogDebug("IsDedicatedServer:", IsDedicatedServer())

        local myPlayerController = AFUtils.GetMyPlayerController()
        if myPlayerController:IsValid() then
            -- LogDebug("myPlayerController: " .. myPlayerController:GetFullName())
            -- LogDebug("ActiveLevelName: " .. myPlayerController.ActiveLevelName:ToString())
            -- local viewTarget = myPlayerController:GetViewTarget()
            -- if IsValid(viewTarget) then
            --     LogDebug("ViewTarget class:", viewTarget:GetClass():GetFullName())
            -- end
            -- local pawn = myPlayerController.Pawn
            -- if IsValid(pawn) then
            --     LogDebug("Controlled Pawn class:", pawn:GetClass():GetFullName())
            -- end

            -- if myPlayerController.DayNightManager:IsValid() then
            --     local dayNightManager = myPlayerController.DayNightManager
            --     AFUtils.TriggerWeatherEvent(AFUtils.WeatherEvents.Fog)
            --     -- dayNightManager.IsNight = false
            --     -- AFUtils.SetNextWeatherEvent(AFUtils.WeatherEvents.Fog)
            --     -- 5:40 o'clock
            --     -- AFUtils.SetGameTime(6, 50)
            --     -- AFUtils.SetGameTime(0.0)
            --     AFUtils.LogDayNightManager(dayNightManager, "DayNightManager.")
            -- end
        end

        -- local playerState = AFUtils.GetMyPlayerState()
        -- if IsValid(playerState) then
            
        -- end
        local myPlayer = AFUtils.GetMyPlayer()
        if IsValid(myPlayer) then
            local location = myPlayer:K2_GetActorLocation()
            LogDebug("myPlayer location: " .. VectorToString(location))

            -- myPlayer.CustomTimeDilation = 3.0
            -- LogDebug("CustomTimeDilation:", myPlayer.CustomTimeDilation)
            -- AFUtils.LogCharacterParentBP(myPlayer)
            -- if myPlayer.CharacterEquipSlotInventory:IsValid() then
            --     AFUtils.LogInventoryComponent(myPlayer.CharacterEquipSlotInventory, "CharacterEquipSlotInventory.")
            -- end
            
            if IsValid(myPlayer.ItemInHand_BP) then
                if myPlayer.ItemInHand_BP:IsA(AFUtils.GetClassAbiotic_Weapon_ParentBP_C()) then
                    AFUtils.LogWeaponParentBP(myPlayer.ItemInHand_BP)
                else
                    AFUtils.LogItemParentBP(myPlayer.ItemInHand_BP)
                end
            end

            -- local components = {}
            -- myPlayer:GetHighlightComponents(components)
            -- LogDebug("HighlightComponents count: ", #components)
            -- for i = 1, #components do
            --     local component = components[i]:get()
            --     LogDebug(i .. ":", component:GetFullName())
            -- end
        end
        
        -- local myInventoryComponent = AFUtils.GetMyInventoryComponent()
        -- if myInventoryComponent:IsValid() then
        --     LogDebug("MyInventoryComponent:")
        --     AFUtils.LogInventoryComponent(myInventoryComponent)
        --     if #myInventoryComponent.CurrentInventory > 1 then
        --         local itemSlot = myInventoryComponent.CurrentInventory[1]
        --         if itemSlot.ItemDataTable_18_BF1052F141F66A976F4844AB2B13062B.RowName ~= NAME_None then
        --             -- local outItemSlotData = {}
        --             -- myInventoryComponent:CreateNewItemWithDefaultData(itemSlot.ItemDataTable_18_BF1052F141F66A976F4844AB2B13062B, 1, outItemSlotData)
        --         end
        --     end
        -- end

        -- local characterProgressionComponent = AFUtils.GetMyCharacterProgressionComponent()
        -- if IsValid(characterProgressionComponent) then
        --     LogDebug("Traits:", #characterProgressionComponent.Traits)
        --     for i = 1, #characterProgressionComponent.Traits do
        --         local trait = characterProgressionComponent.Traits[i]
        --         LogDebug(i .. ": ", trait:ToString())
        --     end

            -- local newTrait = UEHelpers.FindFName("Trait_SteelBladder")
            -- if newTrait ~= NAME_None then
            --     characterProgressionComponent.Traits[#characterProgressionComponent.Traits + 1] = newTrait
            -- end
        -- end

        -- local inventoryCraftingArea = AFUtils.GetMyInventoryCraftingArea()
        -- if inventoryCraftingArea then
        --     LogDebug("inventoryCraftingArea: " .. inventoryCraftingArea:GetFullName())
        --     if inventoryCraftingArea.LastSelectedRecipe:IsValid() then
        --         AFUtils.LogCraftingEntryItem(inventoryCraftingArea.LastSelectedRecipe, "LastSelectedRecipe.")
        --     end
        -- end

        -- local worldMetadataSave = FindFirstOf("Abiotic_WorldMetadataSave_C") ---@cast worldMetadataSave UAbiotic_WorldMetadataSave_C
        -- if worldMetadataSave:IsValid() then
        --     LogDebug("GlobalUnlocks.WorldVersion: " .. worldMetadataSave.WorldVersion)
        --     LogDebug("GlobalUnlocks.MinutesPassed: " .. worldMetadataSave.MinutesPassed)
        --     LogDebug("GlobalUnlocks.ActiveLeyakContainmentID: " .. worldMetadataSave.GlobalUnlocks.ActiveLeyakContainmentID_48_759AE779473F27DD9483AAB34D22A795:ToString())
        --     LogDebug("GlobalUnlocks.SaveIdentifier: " .. worldMetadataSave.SaveIdentifier:ToString())
        --     LogDebug("GlobalUnlocks.SaveVersion: " .. worldMetadataSave.SaveVersion)
        -- end

        -- local gameState = AFUtils.GetSurvivalGameState()
        -- if gameState:IsValid() then
        --     LogDebug("GameState.Class: " .. gameState:GetClass():GetFullName())
        --     LogDebug("MatchState: " .. gameState.MatchState:ToString())
        --     -- gameState["Set Leyak Containment ID"]("")
        --     LogDebug("ActiveLeyakContainmentID: " .. gameState.ActiveLeyakContainmentID:ToString())
        -- end

        -- local powerSockets = FindAllOf("PowerSocket_ParentBP_C")
        -- ---@cast powerSockets APowerSocket_ParentBP_C[]?
        -- if powerSockets then
        --     LogDebug("PowerSocke count: " .. #powerSockets)
        --     for i = 1, #powerSockets, 1 do
        --         ---@type APowerSocket_ParentBP_C
        --         local powerSocket = powerSockets[i]
        --         if powerSocket:IsValid() then
        --             LogDebug("Socket: " .. i .. " SocketAlwaysPowered: ", powerSocket.SocketAlwaysPowered)
        --             -- powerSocket.SocketAlwaysPowered = true
        --         end
        --     end
        -- end

        -- local worldSettings = GetWorldSettings()
        -- ---@cast worldSettings AAbioticWorldSettings?
        -- if worldSettings then
        --     AFUtils.LogWorldSettings(worldSettings)
        -- end

        -- local outRowHandles = {}
        -- AFUtils.GetWeatherEventHandleFunctionLibrary():GetAllWeatherEventRowHandles(outRowHandles)
        -- LogDebug("WeatherEventRowHandles Num: " .. #outRowHandles)
        -- for i = 1, #outRowHandles, 1 do
        --     local rowHandle = outRowHandles[i]:get()
        --     LogDebug(string.format("%d: RowName: %s", i, rowHandle.RowName:ToString()))
        -- end
        LogDebug("------------------------------")
    end)
end)

RegisterKeyBind(Key.O, function()
    ExecuteInGameThread(function()
        LogDebug("------------ O ---------------")
        -- local transform = {
        --     Translation = {
        --         X = 11.0,
        --         Y = 22.0,
        --         Z = 33.0
        --     },
        --     Rotation = {
        --         X = 1.0,
        --         Y = 2.0,
        --         Z = 3.0,
        --         W = 4.0
        --     },
        --     Scale3D = {
        --         X = 21.0,
        --         Y = 32.0,
        --         Z = 43.0
        --     }
        -- }
        -- local transform = GetKismetMathLibrary():MakeTransform(FVector(12.0, 13.0, 14.0), FRotator(22.0, 33.0, 44.0), FVector(1.0, 1.0, 1.0))
        -- LogDebug("transform:", TableToString(transform))
        -- local transformString = UEHelpers.GetKismetStringLibrary():Conv_TransformToString(transform)
        -- print("transformString: " .. transformString:ToString() .. "\n")

        -- local PlayerController = UEHelpers.GetPlayerController()
        -- if PlayerController:IsValid() then
        --     print(string.format("PlayerController address: %s\n", tostring(PlayerController:GetAddress())))
        --     print(string.format("PlayerController world address: %s\n", tostring(PlayerController:GetWorld():GetAddress())))
        -- end
        -- local GameInstance = UEHelpers.GetGameInstance()
        -- if GameInstance:IsValid() then
        --     print(string.format("GameInstance address: %s\n", tostring(GameInstance:GetAddress())))
        --     print(string.format("GameInstance world address: %s\n", tostring(GameInstance:GetWorld():GetAddress())))
        -- end
        -- local World = UEHelpers.GetWorld()
        -- if World:IsValid() then
        --     print(string.format("World address: %s\n", tostring(World:GetAddress())))
        -- end
        local Player = UEHelpers.GetPlayer()
        if Player:IsValid() then
            print(string.format("Player address: %s\n", tostring(Player:GetAddress())))
            print(string.format("Player world address: %s\n", tostring(Player:GetWorld():GetAddress())))
            
            LogDebug("FixHeldItemLiquid: ", AFUtils.FixHeldItemLiquid(Player))

            -- local spawnedActor = SpawnActorFromClass("/Game/Blueprints/DeployedObjects/Furniture/Deployed_StorageCrate_Makeshift_T2.Deployed_StorageCrate_Makeshift_T2_C", Player:K2_GetActorLocation(), Player:K2_GetActorRotation())
            -- if IsValid(spawnedActor) then
            --     LogDebug("spawnedActor location:", VectorToString(spawnedActor:K2_GetActorLocation()))
            --     LogDebug("spawnedActor rotation:", RotatorToString(spawnedActor:K2_GetActorRotation()))
            -- end
            
            -- local spawnedActorByClassName = SpawnActorByClassName("/Game/Blueprints/DeployedObjects/Furniture/Deployed_StorageCrate_Makeshift_T2.Deployed_StorageCrate_Makeshift_T2_C", Player:K2_GetActorLocation(), Player:K2_GetActorRotation())
            -- if spawnedActorByClassName:IsValid() then
            --     LogDebug("spawnedActorByClassName location:", VectorToString(spawnedActorByClassName:K2_GetActorLocation()))
            --     LogDebug("spawnedActorByClassName rotation:", RotatorToString(spawnedActorByClassName:K2_GetActorRotation()))
            -- end
        end
        -- local playerController = UEHelpers.GetPlayerController()
        -- if playerController:IsValid() then
        --     print(string.format("playerController: %s\n", playerController:GetFullName()))
        -- else
        --     print("playerController invalid\n")
        -- end
        -- local player = UEHelpers.GetPlayer()
        -- if player:IsValid() then
        --     print(string.format("player: %s\n", player:GetFullName()))
        -- else
        --     print("player invalid\n")
        -- end
        -- local engine = UEHelpers.GetEngine()
        -- if engine:IsValid() then
        --     print(string.format("engine: %s\n", engine:GetFullName()))
        -- else
        --     print("engine invalid\n")
        -- end
        -- local gameInstance = UEHelpers.GetGameInstance()
        -- if gameInstance:IsValid() then
        --     print(string.format("gameInstance: %s\n", gameInstance:GetFullName()))
        -- else
        --     print("gameInstance invalid\n")
        -- end
        -- local gameViewportClient = UEHelpers.GetGameViewportClient()
        -- if gameViewportClient:IsValid() then
        --     print(string.format("gameViewportClient: %s\n", gameViewportClient:GetFullName()))
        -- else
        --     print("gameViewportClient invalid\n")
        -- end
        -- local world = UEHelpers.GetWorld()
        -- if world:IsValid() then
        --     print(string.format("world: %s\n", world:GetFullName()))
        -- else
        --     print("world invalid\n")
        -- end
        -- print(string.format("WorldDeltaSeconds: %f\n", UEHelpers.GetGameplayStatics():GetWorldDeltaSeconds(UEHelpers.GetWorldContextObject())))
        -- local persistentLevel = UEHelpers.GetPersistentLevel()
        -- if persistentLevel:IsValid() then
        --     print(string.format("persistentLevel: %s\n", persistentLevel:GetFullName()))
        -- else
        --     print("persistentLevel invalid\n")
        -- end
        -- local worldSettings = UEHelpers.GetWorldSettings()
        -- if worldSettings:IsValid() then
        --     print(string.format("worldSettings: %s\n", worldSettings:GetFullName()))
        -- else
        --     print("worldSettings invalid\n")
        -- end
        -- local gameModeBase = UEHelpers.GetGameModeBase()
        -- if gameModeBase:IsValid() then
        --     print(string.format("gameModeBase: %s\n", gameModeBase:GetFullName()))
        -- else
        --     print("gameModeBase invalid\n")
        -- end
        -- local gameStateBase = UEHelpers.GetGameStateBase()
        -- if gameStateBase:IsValid() then
        --     print(string.format("gameStateBase: %s\n", gameStateBase:GetFullName()))
        -- else
        --     print("gameStateBase invalid\n")
        -- end
        -- local playerStates = UEHelpers.GetAllPlayerStates()
        -- print(string.format("playerStates Count: %d\n", #playerStates))
        -- for i, playerState in ipairs(playerStates) do
        --     if playerState:IsValid() then
        --         print(string.format("%d: playerState: %s\n", i, playerState:GetFullName()))
        --         print(string.format("%d: playerState Class: %s\n", i, playerState:GetClass():GetFullName()))
        --     end
        -- end
        -- local players = UEHelpers.GetAllPlayers()
        -- print(string.format("players Count: %d\n", #players))
        -- for i, player in ipairs(players) do
        --     if player:IsValid() then
        --         print(string.format("%d: player: %s\n", i, player:GetFullName()))
        --         print(string.format("%d: player Class: %s\n", i, player:GetClass():GetFullName()))
        --     end
        -- end

        -- local myPlayerController = AFUtils.GetMyPlayerController()
        -- if myPlayerController:IsValid() then
        --     LogDebug("ActiveLevelName: " .. myPlayerController.ActiveLevelName:ToString())
        --     if myPlayerController.DayNightManager:IsValid() then
        --         local dayNightManager = myPlayerController.DayNightManager
        --         AFUtils.LogDayNightManager(dayNightManager, "DayNightManager.")
        --     end
        -- end

        -- local npcSpawns = FindAllOf("Abiotic_NPCSpawn_ParentBP_C") ---@type AAbiotic_NPCSpawn_ParentBP_C[]?
        -- if npcSpawns then
        --     LogDebug("NPCSpawn's count:", #npcSpawns)
        --     local npcSpawned = 0
        --     for i = 1, #npcSpawns do
        --         local npcSpawn = npcSpawns[i]
        --         local IsOnCooldown = npcSpawn:IsOnCooldown()
        --         LogDebug(i .. ": IsOnCooldown:",IsOnCooldown)
        --         LogDebug("AllowableSpawnHours (enum 0-3):",npcSpawn.AllowableSpawnHours)
        --         -- LogDebug("NPCsAllowedFromSpawn:",npcSpawn.NPCsAllowedFromSpawn)
        --         -- LogDebug("CanSpawnInLineOfSight:",npcSpawn.CanSpawnInLineOfSight)
        --         -- LogDebug("ShouldSpawnSkipPlayerChecks:",npcSpawn.ShouldSpawnSkipPlayerChecks)
        --         -- LogDebug("AlwaysPassDistanceCheck:",npcSpawn.AlwaysPassDistanceCheck)
        --         LogDebug("NPC Level:",npcSpawn['NPC Level'])
        --         LogDebug("NoLoot:",npcSpawn.NoLoot)
        --         local outSuccess = { Success = false }
        --         local outSpawnedNPC = { SpawnedNPC = CreateInvalidObject() }
        --         local outDebugMessage = { DebugMessage = CreateInvalidObject() }
        --         local outResponse = { Response = 0 }
        --         npcSpawn:TrySpawnNPCNew(true, true, false, outSuccess, outSpawnedNPC, outDebugMessage, outResponse)
        --         LogDebug(i .. ": Spawn result:")
        --         LogDebug("  Success:", outSuccess.Success)
        --         LogDebug("  SpawnedNPC:IsValid:", outSpawnedNPC.SpawnedNPC:IsValid())
        --         if outSuccess.Success == true then
        --             npcSpawned = npcSpawned + 1
        --         end
        --         -- LogDebug("  DebugMessage type:", outDebugMessage.DebugMessage:type())
        --         -- if outDebugMessage.DebugMessage and outDebugMessage.DebugMessage:IsValid() then
        --         -- end
        --         -- LogDebug("  Response:", outResponse.Response)
                
        --     end
        --     LogDebug("NPCs Spawned:", npcSpawned)
        -- end
        
        -- local aiDirector = AFUtils.GetAIDirector()
        -- if aiDirector then
        --     -- local cooldownInMin = 1.0
        --     -- aiDirector.LeyakCooldown = cooldownInMin * 60.0
        --     -- aiDirector:SetLeyakOnCooldown(1.0)
        --     -- LogDebug("LeyakCooldown set to: "..aiDirector.LeyakCooldown.." ("..cooldownInMin.." min)")
        -- end

        -- local leyakContainment = FindFirstOf("Deployed_LeyakContainment_C") ---@cast leyakContainment ADeployed_LeyakContainment_C
        -- if leyakContainment:IsValid() then
        --     LogDebug("TrapLeyak:",AFUtils.TrapLeyak(leyakContainment))
        -- end
        -- local leyakContainments = FindAllOf("Deployed_LeyakContainment_C") ---@cast leyakContainments ADeployed_LeyakContainment_C[]?
        -- if leyakContainments then
        --     for i = 1, #leyakContainments do
        --         local leyakContainment = leyakContainments[i]
        --         leyakContainment:TrapLeyak(0.1)
        --         break
        --     end
        -- end
        LogDebug("------------------------------")
    end)
end)

local TraceType = 3
RegisterKeyBind(Key.Z, function()
    ExecuteInGameThread(function()
        LogDebug("Fire ForwardLineTraceByChannel with type: " .. TraceType)
        local hitActor = ForwardLineTraceByChannel(TraceType)
        if hitActor:IsValid() then
            LogDebug("--- [ForwardLineTraceByChannel]:")
            LogDebug("HitActor: " .. hitActor:GetFullName())
            LogDebug("ClassName: " .. hitActor:GetClass():GetFullName())
            
            if hitActor:IsA(GetStaticClassActor()) then
                ---@cast hitActor AActor
                LogDebug("Location: ", VectorToString(hitActor:K2_GetActorLocation()))
            end
            if hitActor:IsA(GetStaticClassStaticMeshComponent()) or hitActor:IsA(GetStaticClassSkeletalMeshComponent()) then
                ---@cast hitActor UMeshComponent
                local actor = hitActor:GetOwner()
                if actor:IsValid() then
                    LogDebug("Owner: ", actor:GetFullName())
                    LogDebug("Owner class: ", actor:GetClass():GetFullName())

                    -- if actor:IsA(AFUtils.GetClassNPC_Base_ParentBP_C()) then
                    --     ---@cast actor ANPC_Base_ParentBP_C
                    --     AFUtils.LogOutlineComponent(actor.OutlineComponent, "OutlineComponent.")
                    -- end
                    if actor:IsA(AFUtils.GetClassGardenPlot_ParentBP_C()) then
                        ---@cast actor AGardenPlot_ParentBP_C
                        AFUtils.LogGardenPlot(actor)
                    end
                end
            end

            -- if hitActor:IsA(AFUtils.GetClassDeployed_Battery_ParentBP_C()) then
            --     AFUtils.LogDeployedBattery(hitActor)
            --     -- hitActor["Update Current Item Data"]()
            -- end
            -- if hitActor:IsA(AFUtils.GetClassAbioticDeployed_ParentBP_C()) then
            --     ---@cast hitActor AAbioticDeployed_ParentBP_C
            --     AFUtils.LogInventoryChangeableDataStruct(hitActor.ChangeableData, "ChangeableData.")
            -- end
            -- if hitActor:IsA(AFUtils.GetClassNarrativeNPC_ParentBP_C()) then
            --     ---@cast hitActor ANarrativeNPC_ParentBP_C
            --     AFUtils.LogNarrativeNPC(hitActor)
            -- end
            -- if hitActor:IsA(AFUtils.GetClassAbiotic_Character_ParentBP_C()) then
            --     ---@cast hitActor AAbiotic_Character_ParentBP_C
            --     AFUtils.LogCharacterParentBP(hitActor)
            -- end
            -- if hitActor:IsA(AFUtils.GetClassCharacterCorpse_ParentBP()) then
            --     ---@cast hitActor ACharacterCorpse_ParentBP_C
            -- end
            LogDebug("------------------------------")
        end
    end)
end)


RegisterKeyBind(Key.U, function()
    ExecuteInGameThread(function()
        LogDebug("Fire ForwardLineTraceByObject with type: " .. TraceType)
        local hitActor = ForwardLineTraceByObject(TraceType)
        if hitActor:IsValid() then
            LogDebug("--- [ForwardLineTraceByObject]:")
            LogDebug("HitActor: " .. hitActor:GetFullName())
            LogDebug("ClassName: " .. hitActor:GetClass():GetFullName())
            
            if hitActor:IsA(GetStaticClassActor()) then
                ---@cast hitActor AActor
                LogDebug("Location: ", VectorToString(hitActor:K2_GetActorLocation()))
            end
            if hitActor:IsA(GetStaticClassStaticMeshComponent()) or hitActor:IsA(GetStaticClassSkeletalMeshComponent()) then
                ---@cast hitActor UMeshComponent
                local actor = hitActor:GetOwner()
                if actor:IsValid() then
                    LogDebug("Owner: ", actor:GetFullName())
                    LogDebug("Owner class: ", actor:GetClass():GetFullName())
                end
            end
            LogDebug("------------------------------")
        end
    end)
end)

RegisterKeyBind(Key.PAGE_UP, function()
    TraceType = TraceType + 1
    if TraceType > 32 then
        TraceType = 0
    elseif TraceType < 0 then
        TraceType = 32
    end
    LogDebug("Trace type: " .. TraceType)
end)

RegisterKeyBind(Key.PAGE_DOWN, function()
    TraceType = TraceType - 1
    if TraceType > 32 then
        TraceType = 0
    elseif TraceType < 0 then
        TraceType = 32
    end
    LogDebug("Trace type: " .. TraceType)
end)

RegisterKeyBind(Key.PAUSE, function()
    ExecuteInGameThread(function()
        LogDebug("------- NoClip (Pause) -------")
        local myPlayer = AFUtils.GetMyPlayer()
        if myPlayer then
            myPlayer.Noclip_On = not myPlayer.Noclip_On
            myPlayer:OnRep_Noclip_On()
            LogDebug("Noclip_On: " .. tostring(myPlayer.Noclip_On))
        end
        LogDebug("------------------------------")
    end)
end)

-- RegisterProcessConsoleExecPreHook(function(Context, FullCommand, CommandParts, Ar, Executor)
--     print("RegisterProcessConsoleExecPreHook:\n")
--     local ContextObject = Context:get()
--     local ExecutorObject = Executor:get()

--     print(string.format("Context FullName: %s\n", ContextObject:GetFullName()))
--     if ExecutorObject:IsValid() then
--         print(string.format("Executor FullName: %s\n", ExecutorObject:GetFullName()))
--     end
--     print(string.format("Command: %s\n", FullCommand))
--     print(string.format("Number of command parts: %i\n", #CommandParts))
    
--     if #CommandParts > 0 then
--         print(string.format("Command Name: %s\n", CommandParts[1]))
--         for PartNumber, CommandPart in ipairs(CommandParts) do
--             print(string.format("CommandPart: #%i -> '%s'\n", PartNumber, CommandPart))
--         end
--     end
--     return true
-- end)

-- RegisterHook("/Game/Blueprints/Characters/Abiotic_PlayerCharacter.Abiotic_PlayerCharacter_C:CanCrouchRoll?",
-- function(Context, CanRoll)
--     local player = Context:get() ---@type AAbiotic_PlayerCharacter_C
--     local canRoll = CanRoll:get() ---@type boolean

--     LogDebug("----- [CanCrouchRoll?] called -----")
--     LogDebug("CanRoll:", canRoll)
--     CanRoll:set(true)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Items/Weapons/Guns/Weapon_FishingRod.Weapon_FishingRod_C:Request_FishingReward",
-- function(Context, Reward, Lucky)
--     local fishingRod = Context:get() ---@type AWeapon_FishingRod_C
--     local reward = Reward:get() ---@type FFishRowHandle
--     local lucky = Lucky:get() ---@type boolean

--     LogDebug("----- [Request_FishingReward] called -----")
--     LogDebug("Reward.RowName:", reward.RowName:ToString())
--     LogDebug("Lucky:", lucky)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Script/AbioticFactor.AbioticFunctionLibrary:CalculateFishingReward",
-- function (Context, FishingZone, TimeOfDayHour, RodTags, BaitTags, PlayerTags, WeatherTags, bHotspot, bNoRares, WorldFlags, bDebug, bWasJunkCatch, OutJunkSalvage, OutFishReward)
--     local functionLibrary = Context:get() ---@type UAbioticFunctionLibrary

--     LogDebug("----- [CalculateFishingReward Pre] called -----")
--     LogDebug("------------------------------")
-- end,
-- function(Context, FishingZone, TimeOfDayHour, RodTags, BaitTags, PlayerTags, WeatherTags, bHotspot, bNoRares, WorldFlags, bDebug, bWasJunkCatch, OutJunkSalvage, OutFishReward)
--     local functionLibrary = Context:get() ---@type UAbioticFunctionLibrary
--     local timeOfDayHour = TimeOfDayHour:get() ---@type integer
--     local hotspot = bHotspot:get() ---@type boolean
--     local noRares = bNoRares:get() ---@type boolean
--     local debug = bDebug:get() ---@type boolean
--     local wasJunkCatch = bWasJunkCatch:get() ---@type boolean

--     LogDebug("----- [CalculateFishingReward Post] called -----")
--     LogDebug("TimeOfDayHour:", timeOfDayHour)
--     LogDebug("bHotspot:", hotspot)
--     LogDebug("bNoRares:", noRares)
--     LogDebug("bDebug:", debug)
--     LogDebug("bWasJunkCatch:", wasJunkCatch)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Script/Engine.Controller:Possess",
-- function(Context, InPawn)
--     local gameMode = Context:get() ---@type AController
--     local pawm = InPawn:get() ---@type APawn

--     LogDebug("----- [Possess] called -----")
--     if IsValid(pawm) then
--         LogDebug("Pawn class:", oldPawn:GetClass():GetFullName())
--     end
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Meta/Abiotic_Survival_GameMode.Abiotic_Survival_GameMode_C:RCON_AddChatMessage",
-- function(Context, Prefix, Message)
--     local gameMode = Context:get() ---@type AAbiotic_Survival_GameMode_C
--     local prefix = Prefix:get() ---@type FString
--     local message = Message:get() ---@type FString

--     LogDebug("----- [RCON_AddChatMessage] called -----")
--     LogDebug("Prefix:",prefix:ToString())
--     LogDebug("Message:",message:ToString())
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Meta/Abiotic_Survival_GameMode.Abiotic_Survival_GameMode_C:RCON_HeartBeat_GetPlayers",
-- function(Context, Data)
--     local gameMode = Context:get() ---@type AAbiotic_Survival_GameMode_C
--     local data = Data:get() ---@type FString

--     LogDebug("----- [RCON_HeartBeat_GetPlayers] called -----")
--     LogDebug("Data:",data:ToString())
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Meta/Abiotic_Survival_GameMode.Abiotic_Survival_GameMode_C:OnReciveRCONConnection",
-- function(Context, Type, Success, Message, SessionID, ServerID)
--     local gameMode = Context:get() ---@type AAbiotic_Survival_GameMode_C
--     local type = Type:get() ---@type uint8
--     local success = Success:get() ---@type boolean
--     local message = Message:get() ---@type FString
--     local sessionID = SessionID:get() ---@type FString
--     local serverID = ServerID:get() ---@type FString

--     LogDebug("----- [OnReciveRCONConnection] called -----")
--     LogDebug("Type:", type)
--     LogDebug("Success:", success)
--     LogDebug("Message:", message:ToString())
--     LogDebug("SessionID:", sessionID:ToString())
--     LogDebug("ServerID:", serverID:ToString())
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Meta/Abiotic_Survival_GameMode.Abiotic_Survival_GameMode_C:OnReciveRCONRequest",
-- function(Context, SessionID, ServerID, RequestID, Request)
--     local gameMode = Context:get() ---@type AAbiotic_Survival_GameMode_C
--     local dessionID = SessionID:get() ---@type FString
--     local serverID = ServerID:get() ---@type FString
--     local requestID = RequestID:get() ---@type integer
--     local request = Request:get() ---@type FString

--     LogDebug("----- [OnReciveRCONRequest] called -----")
--     LogDebug("SessionID:", dessionID:ToString())
--     LogDebug("ServerID:", serverID:ToString())
--     LogDebug("RequestID:", requestID)
--     LogDebug("Request:", request:ToString())
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Characters/Abiotic_PlayerCharacter.Abiotic_PlayerCharacter_C:Server_TrySwapItems",
-- function(Context, Inventory1, SlotIndex1, Inventory2, SlotIndex2)
--     local playerCharacter = Context:get() ---@type AAbiotic_PlayerCharacter_C
--     local originInventory = Inventory1:get() ---@type UAbiotic_InventoryComponent_C
--     local originSlotIndex = SlotIndex1:get() ---@type integer
--     local targetInventory = Inventory2:get() ---@type UAbiotic_InventoryComponent_C
--     local targetSlotIndex = SlotIndex2:get() ---@type integer

--     LogDebug("----- [Server_TrySwapItems] called -----")
--     if IsValid(targetInventory) then
--         local owner = targetInventory:GetOwner()
--         if IsValid(owner) then
--             LogDebug("TargetInventory Owner:",owner:GetClass():GetFullName())
--         end
--     end
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/DeployedObjects/Furniture/AbioticDeployed_CraftingBench_ParentBP.AbioticDeployed_CraftingBench_ParentBP_C:UpdateUpgradeComponents",
-- function(Context)
--     local craftingBench = Context:get() ---@type AAbioticDeployed_CraftingBench_ParentBP_C

--     LogDebug("----- [UpdateUpgradeComponents] called -----")
--     LogDebug("GameplayTags Num:", #craftingBench.UpgradeTagContainer.GameplayTags)
--     for i = 1, #craftingBench.UpgradeTagContainer.GameplayTags do
--         local gameplayTag = craftingBench.UpgradeTagContainer.GameplayTags[i]
--         LogDebug(i .. ": .GameplayTags:", gameplayTag.TagName:ToString())
--     end
--     LogDebug("ParentTags Num:", #craftingBench.UpgradeTagContainer.ParentTags)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/DeployedObjects/Furniture/Deployed_LeyakContainment.Deployed_LeyakContainment_C:ServerUpdateStabilityLevel",
-- function(Context, Value)
--     local leyakContainment = Context:get() ---@type ADeployed_LeyakContainment_C
--     local value = Value:get()

--     LogDebug("----- [ServerUpdateStabilityLevel] called -----")
--     LogDebug("Value:", value)
--     -- AFUtils.LogDeployedLeyakContainment(leyakContainment)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/DeployedObjects/Furniture/Deployed_LeyakContainment.Deployed_LeyakContainment_C:OnRep_Stability Level",
-- function(Context)
--     local leyakContainment = Context:get() ---@type ADeployed_LeyakContainment_C

--     LogDebug("----- [OnRep_Stability Level] called -----")
--     -- AFUtils.LogDeployedLeyakContainment(leyakContainment)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/DeployedObjects/Furniture/Deployed_LeyakContainment.Deployed_LeyakContainment_C:OnRep_ContainsLeyak",
-- function(Context)
--     local leyakContainment = Context:get() ---@type ADeployed_LeyakContainment_C

--     LogDebug("----- [OnRep_ContainsLeyak] called -----")
--     AFUtils.LogDeployedLeyakContainment(leyakContainment)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/DeployedObjects/Furniture/Deployed_LeyakContainment.Deployed_LeyakContainment_C:Free Leyak",
-- function(Context)
--     local leyakContainment = Context:get() ---@type ADeployed_LeyakContainment_C

--     LogDebug("----- [Free Leyak] called -----")
--     AFUtils.LogDeployedLeyakContainment(leyakContainment)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/DeployedObjects/Furniture/Deployed_LeyakContainment.Deployed_LeyakContainment_C:TrapLeyak",
-- function(Context)
--     local leyakContainment = Context:get() ---@type ADeployed_LeyakContainment_C

--     LogDebug("----- [TrapLeyak] called -----")
--     -- AFUtils.LogDeployedLeyakContainment(leyakContainment)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/DeployedObjects/Furniture/Deployed_LeyakContainment.Deployed_LeyakContainment_C:NewDayUpdate",
-- function(Context)
--     local leyakContainment = Context:get() ---@type ADeployed_LeyakContainment_C

--     LogDebug("----- [NewDayUpdate] called -----")
--     AFUtils.LogDeployedLeyakContainment(leyakContainment)
--     LogDebug("------------------------------")
-- end)


-- RegisterHook("/Game/Blueprints/DeployedObjects/Furniture/Deployed_LeyakContainment.Deployed_LeyakContainment_C:ProduceLeyakEssence",
-- function(Context)
--     local leyakContainment = Context:get() ---@type ADeployed_LeyakContainment_C

--     LogDebug("----- [ProduceLeyakEssence] called -----")
--     -- AFUtils.LogDeployedLeyakContainment(leyakContainment)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Meta/Abiotic_GameInstance.Abiotic_GameInstance_C:IsCustomizationRowUnlocked", function(Context, RowName, Unlocked)
--     local gameInstance = Context:get() ---@type UAbiotic_GameInstance_C
--     local rowName = RowName:get()
--     local unlocked = Unlocked:get()

--     LogDebug("----- [IsCustomizationRowUnlocked] called -----")
--     LogDebug("RowName: " .. rowName:ToString())
--     LogDebug("Unlocked:", unlocked)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Meta/Abiotic_GameInstance.Abiotic_GameInstance_C:CheckCustomizationSpecialConditions", function(Context, Conditions, Unlocked)
--     local gameInstance = Context:get() ---@type UAbiotic_GameInstance_C
--     local conditions = Conditions:get()
--     local unlocked = Unlocked:get()

--     LogDebug("----- [CheckCustomizationSpecialConditions] called -----")
--     LogDebug("Conditions: " .. conditions:ToString())
--     LogDebug("Unlocked:", unlocked)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Widgets/Inventory/W_Inventory_CraftingArea.W_Inventory_CraftingArea_C:RefreshCraftingEligibility",
-- function(Context)
--     local craftingArea = Context:get() ---@type UW_Inventory_CraftingArea_C

--     LogDebug("----- [RefreshCraftingEligibility] called -----")
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Widgets/Inventory/W_Inventory_CraftingArea.W_Inventory_CraftingArea_C:RefreshRecipeList",
-- function(Context)
--     local craftingArea = Context:get() ---@type UW_Inventory_CraftingArea_C

--     LogDebug("----- [RefreshRecipeList] called -----")
--     LogDebug("CraftingEntries Num:", #craftingArea.CraftingEntries)
--     for i = 1, #craftingArea.CraftingEntries, 1 do
--         local craftingEntry = craftingArea.CraftingEntries[i]
--         local prefix = i .. ": "
--         -- LogDebug(prefix .. "RecipeItems Num:", #craftingEntry.RecipeItems)
--         -- for j = 1, #craftingEntry.RecipeItems, 1 do
--         --     craftingEntry.RecipeItems[j].Count = 0
--         -- end
--     end
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Widgets/Inventory/W_Inventory_CraftingArea.W_Inventory_CraftingArea_C:UpdateSelectedRecipeItem",
-- function(Context, Recipe, Success)
--     local craftingArea = Context:get() ---@type UW_Inventory_CraftingArea_C
--     local recipe = Recipe:get() ---@type FAbioticRecipe_Struct
--     local success = Success:get() ---@type boolean

--     LogDebug("----- [UpdateSelectedRecipeItem] called -----")
--     AFUtils.LogRecipeStruct(recipe, "Recipe.")
--     LogDebug("Success:", success)
--     -- for i = 1, #craftingArea.SelectedRecipe.RecipeItems_7_0F13BA7A407C72065EE926B9D41B8B9E, 1 do
--     --     craftingArea.SelectedRecipe.RecipeItems_7_0F13BA7A407C72065EE926B9D41B8B9E[i].Count_6_4C6C5BFB4956F9C29A5C2BB6F28B7690 = 0
--     -- end
--     -- for i = 1, #craftingArea.LastSelectedRecipe.RecipeItems, 1 do
--     --     craftingArea.LastSelectedRecipe.RecipeItems[i].Count = 0
--     -- end
--     -- local inventoryComponent = AFUtils.GetMyInventoryComponent()
--     -- if inventoryComponent and #inventoryComponent.CurrentInventory > 3 then
--     --     for i = 1, #recipe.RecipeItems_7_0F13BA7A407C72065EE926B9D41B8B9E, 1 do
--     --         local recipeItem = recipe.RecipeItems_7_0F13BA7A407C72065EE926B9D41B8B9E[i]
--     --         if AFUtils.SetItemSlot(inventoryComponent.CurrentInventory[i], recipeItem.Item_5_5AD3D6B1470ED45BCB2D15BC84BB0F1A.RowName, 99) then
--     --             LogDebug(i .. ": Item set: " .. recipeItem.Item_5_5AD3D6B1470ED45BCB2D15BC84BB0F1A.RowName:ToString())
--     --         end
--     --     end
--     -- end
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Widgets/Inventory/W_Inventory_CraftingArea.W_Inventory_CraftingArea_C:UpdateCurrentlySelectedItemInfo",
-- function(Context, RecipeEntry, SameAsBefore)
--     local craftingArea = Context:get() ---@type UW_Inventory_CraftingArea_C
--     local recipeEntry = RecipeEntry:get() ---@type UCraftingEntryItem
--     local sameAsBefore = SameAsBefore:get() ---@type boolean

--     LogDebug("----- [UpdateCurrentlySelectedItemInfo] called -----")
--     AFUtils.LogCraftingEntryItem(recipeEntry, "RecipeEntry.")
--     LogDebug("SameAsBefore:", sameAsBefore)
--     -- for i = 1, #craftingArea.SelectedRecipe.RecipeItems_7_0F13BA7A407C72065EE926B9D41B8B9E, 1 do
--     --     craftingArea.SelectedRecipe.RecipeItems_7_0F13BA7A407C72065EE926B9D41B8B9E[i].Count_6_4C6C5BFB4956F9C29A5C2BB6F28B7690 = 0
--     -- end
--     -- for i = 1, #craftingArea.LastSelectedRecipe.RecipeItems, 1 do
--     --     craftingArea.LastSelectedRecipe.RecipeItems[i].Count = 0
--     -- end
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Characters/Abiotic_PlayerCharacter.Abiotic_PlayerCharacter_C:Request_CraftItem",
-- function(Context, ItemDataTableRow, ConsumeItems, CountToCraft, CraftDuration, CraftingBench, RecipeCategory)
--     local playerCharacter = Context:get()
--     local itemDataTableRow = ItemDataTableRow:get() ---@type FDataTableRowHandle
--     local consumeItems = ConsumeItems:get()
--     local countToCraft = CountToCraft:get()
--     local craftDuration = CraftDuration:get()
--     local craftingBench = CraftingBench:get()
--     local recipeCategory = RecipeCategory:get()

--     LogDebug("----- [Request_CraftItem] called -----")
--     LogDebug("ItemDataTableRow: " .. itemDataTableRow.RowName:ToString())
--     LogDebug("ConsumeItems Num: " .. #consumeItems)
--     LogDebug("CountToCraft:", countToCraft)
--     LogDebug("CraftDuration:", craftDuration)
--     LogDebug("CraftingBench:", craftingBench)
--     LogDebug("RecipeCategory: " .. recipeCategory)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Libraries/AbioticFunctionLibrary.AbioticFunctionLibrary_C:CheckAvailableRecipeItems",
-- function(Context, TargetCharacter, AdditionalInventories, ItemCount, RequireBenches, ItemSlot, PlayerCraftingOnly, WorldContext, AtLeastOneItemIsMissing)
--     local abioticFunctionLibrary = Context:get() ---@type UAbioticFunctionLibrary_C
--     local targetCharacter = TargetCharacter:get() ---@type AAbiotic_PlayerCharacter_C
--     local additionalInventories = AdditionalInventories:get() ---@type UAbiotic_InventoryComponent_C[]
--     local itemCount = ItemCount:get() ---@type FAbioticItemCount_Struct
--     local requireBenches = RequireBenches:get() ---@type boolean
--     local itemSlot = ItemSlot:get() ---@type UW_InventoryItemSlot_C
--     local playerCraftingOnly = PlayerCraftingOnly:get() ---@type boolean
--     local worldContext = WorldContext:get() ---@type UObject
--     local atLeastOneItemIsMissing = AtLeastOneItemIsMissing:get() ---@type boolean

--     LogDebug("----- [CheckAvailableRecipeItems] called -----")
--     LogDebug("AdditionalInventories Num: " .. #additionalInventories)
--     LogDebug("ItemCount.Item.RowName: " .. itemCount.Item_5_5AD3D6B1470ED45BCB2D15BC84BB0F1A.RowName:ToString())
--     LogDebug("ItemCount.Count: " .. itemCount.Count_6_4C6C5BFB4956F9C29A5C2BB6F28B7690)
--     LogDebug("RequireBenches:", requireBenches)
--     LogDebug("PlayerCraftingOnly:", playerCraftingOnly)
--     LogDebug("AtLeastOneItemIsMissing:", atLeastOneItemIsMissing)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Characters/Abiotic_PlayerCharacter.Abiotic_PlayerCharacter_C:Owning_OnLevelLoadUpdated", function(Context, Level)
--     local playerCharacter = Context:get()

--     LogDebug("----- [Owning_OnLevelLoadUpdated] called -----")
--     LogDebug("------------------------------")
-- end)

-- ExecuteInGameThread(function()
--     LoadAsset("/Game/Blueprints/DeployedObjects/Furniture/Deployed_Toilet_Portal.Deployed_Toilet_Portal_C")
--     RegisterHook("/Game/Blueprints/DeployedObjects/Furniture/Deployed_Toilet_Portal.Deployed_Toilet_Portal_C:DistantShoreCheck", function(Context, Character, DistantShore)
--         local deployedToiletPortal = Context:get()
--         local character = Character:get()
--         local distantShore = DistantShore:get()

--         LogDebug("----- [DistantShoreCheck] called -----")
--         LogDebug("DistantShore: ", distantShore)
--         if not distantShore then
--             deployedToiletPortal:SendToDistantShore(character)
--         end
--         LogDebug("------------------------------")
--     end)
-- end)

-- RegisterHook("/Game/Blueprints/Environment/Systems/DayNightManager.DayNightManager_C:CheckPlayersLeftStartingZone", function(Context, LeftZone)
--     local dayNightManager = Context:get()
--     local leftZone = LeftZone:get()

--     LogDebug("----- [CheckPlayersLeftStartingZone] called -----")
--     LogDebug("LeftZone: ", leftZone)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Script/Engine.PlayerController:ServerAcknowledgePossession", function(Context, Pawn)
--     local playerController = Context:get()
--     local pawn = Pawn:get()

--     LogDebug("----- [ServerAcknowledgePossession] called -----")
--     LogDebug("Pawn.Class: " .. pawn:GetClass():GetFullName())
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Characters/Abiotic_PlayerCharacter.Abiotic_PlayerCharacter_C:GetCurrentHeldItem", function(Context, Success, ItemSlotInfo, ItemData, Blueprint)
--     local playerCharacter = Context:get()
--     local success = Success:get()
--     local itemSlotInfo = ItemSlotInfo:get()
--     local itemData = ItemData:get()
--     local blueprint = Blueprint:get() -- AAbiotic_Item_ParentBP_C

--     if success then
--         LogDebug("[GetCurrentHeldItem] called:")
--         LogDebug("Success: " .. tostring(success))

--         LogDebug("CurrentHotbarSlotSelected.Index: " ..  playerCharacter.CurrentHotbarSlotSelected.Index_5_6BDC7B3944A5DE0B319F9FA20720872F)
--         LogDebug("LastSelectedHotbarSlot: " ..  playerCharacter.LastSelectedHotbarSlot)
--         -- AFUtils.LogInventoryItemSlotStruct(itemSlotInfo, "ItemSlotInfo.")
--         -- LogDebug("---")
--         -- AFUtils.LogInventoryItemStruct(itemData, "ItemData.")
--         -- LogDebug("---")
--         -- AFUtils.LogInventoryItemStruct(playerCharacter.CurrentHeldItemData, "CurrentHeldItemData.")
--         LogDebug("---")
--         if blueprint:IsValid() then
--             LogDebug("Blueprint: " .. blueprint:GetClass():GetFullName())
--             if blueprint:IsA(AFUtils.GetClassAbiotic_Item_ParentBP_C()) then
--                 AFUtils.LogItemParentBP(blueprint, "Blueprint.")
--                 LogDebug("---")
--                 -- AFUtils.LogInventoryItemStruct(blueprint.ItemData, "Blueprint.ItemData.")
--                 -- AFUtils.LogInventoryChangeableDataStruct(blueprint.ChangeableData, "Blueprint.ChangeableData.")
--             end
--             -- LogDebug("BlueprintCreatedComponents Num: " .. #blueprint.BlueprintCreatedComponents)
--             -- for i = 1, #blueprint.BlueprintCreatedComponents, 1 do
--             --     local component = blueprint.BlueprintCreatedComponents[i]
--             --     if component:IsValid() then
--             --         LogDebug(i .. ": " .. component:GetClass():GetFullName())
--             --     end
--             -- end
--         end
--         LogDebug("------------------------------")
--     end
-- end)

-- RegisterHook("/Game/Blueprints/Characters/Abiotic_InventoryComponent.Abiotic_InventoryComponent_C:GetItemInSlot", function(Context, Index, Success, SlotData, ItemData)
--     local this = Context:get()
--     local index = Index:get()
--     local success = Success:get()
--     local slotData = SlotData:get()
--     local itemData = ItemData:get()

--     LogDebug("[InventoryComponent_C:GetItemInSlot] called:")
--     LogDebug("Index: " .. index)
--     LogDebug("Success: " .. tostring(success))
--     AFUtils.LogInventoryItemSlotStruct(itemSlotInfo, "SlotData.")
--     LogDebug("---")
--     AFUtils.LogInventoryItemStruct(itemData, "ItemData.")
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Environment/Systems/Abiotic_AIDirector.Abiotic_AIDirector_C:SpawnLeyak", function(Context, Location)
--     local aiDirector = Context:get()
--     local location = Location:get()

--     LogDebug("----- [SpawnLeyak] called -----")
--     -- local aiControllerLeyak = FindFirstOf("AI_Controller_Leyak_C")
--     -- if aiControllerLeyak and aiControllerLeyak:IsValid() then
--     --     LogDebug("AI_Controller_Leyak_C found, call Despawn")
--     --     aiControllerLeyak:Despawn()
--     -- end
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Environment/Systems/Abiotic_AIDirector.Abiotic_AIDirector_C:LeyakFailsafeRemove", function(Context)
--     local aIDirector = Context:get()

--     LogDebug("[Abiotic_AIDirector_C:LeyakFailsafeRemove] called:")
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Characters/NPCs/AI_Controller_Leyak.AI_Controller_Leyak_C:Despawn", function(Context)
--     local aiControllerLeyak = Context:get()

--     LogDebug("[AI_Controller_Leyak_C:Despawn] called:")
--     -- local aiDirector = FindFirstOf("Abiotic_AIDirector_C")
--     -- if aiDirector and aiDirector:IsValid() then
--     --     LogDebug("LeyakCooldown: " .. aiDirector.LeyakCooldown)
--     --     if aiDirector.ActiveLeyak:IsValid() then
--     --         AFUtils.LogNPCLeyak(aiDirector.ActiveLeyak, "ActiveLeyak.")
--     --     end
--     -- end
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Environment/Systems/Abiotic_AIDirector.Abiotic_AIDirector_C:SetLeyakOnCooldown", function(Context, CooldownReductionMultiplier)
--     local aiDirector = Context:get()
--     local cooldownReductionMultiplier = CooldownReductionMultiplier:get()

--     LogDebug("[Abiotic_AIDirector_C:SetLeyakOnCooldown] called:")
--     LogDebug("CooldownReductionMultiplier: " .. cooldownReductionMultiplier)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Characters/NPCs/NPC_Leyak.NPC_Leyak_C:UpdateLeyakVisibility", function(Context)
--     local leyak = Context:get()

--     LogDebug("[UpdateLeyakVisibility] called:")
--     -- leyak.SeenDespawnTime = 0.1
--     -- leyak.TimeAllowedToBeStuck = 0.1
--     -- leyak.AbsolutelyStuck = true
--     -- AFUtils.LogNPCLeyak(leyak)
--     LogDebug("------------------------------")
-- end)

-- local JagerName = NAME_None
-- local function GetJagerName()
--     if JagerName == NAME_None then
--         JagerName = FName("Jager", EFindName.FNAME_Find)
--     end
--     return JagerName
-- end

-- LoopAsync(500, function()
--     local humanNPCs = FindAllOf("NarrativeNPC_Human_ParentBP_C")
--     if humanNPCs then
--         for i, humanNPC in ipairs(humanNPCs) do
--             ---@cast humanNPC ANarrativeNPC_Human_ParentBP_C
--             local JagerName = GetJagerName()
--             if JagerName ~= NAME_None and humanNPC.NarrativeNPC_ConversationRow.RowName == JagerName and humanNPC.IsDead then
--                 LogDebug("Found dead Dr. Jager, destroy actor")
--                 ExecuteInGameThread(function()
--                     humanNPC:K2_DestroyActor()
--                 end)
--                 return true
--             end
--         end
--     end
--     return false
-- end)

-- RegisterHook("/Game/Blueprints/Characters/Abiotic_InventoryComponent.Abiotic_InventoryComponent_C:UpdateInventorySlotCount", function(Context, NewMaxSlots)
--     local inventoryComponent = Context:get() ---@type UAbiotic_InventoryComponent_C
--     local newMaxSlots = NewMaxSlots:get()

--     local myPlayer = AFUtils.GetMyPlayer()
--     if IsValid(myPlayer) and myPlayer.CharacterInventory:IsValid() and myPlayer.CharacterHotbarInventory:IsValid() then
--         if myPlayer.CharacterInventory:GetAddress() == inventoryComponent:GetAddress() then
--             LogDebug("[UpdateInventorySlotCount] called: -----")
--             LogDebug("NewMaxSlots: "..newMaxSlots)
--             AFUtils.LogInventoryComponent(inventoryComponent)
--             LogDebug("------------------------------")
--             -- local targetMaxSlots = 42
--             -- if newMaxSlots < targetMaxSlots then
--             --     inventoryComponent.InitialInventorySize = targetMaxSlots
--             --     inventoryComponent.MaxSlots = targetMaxSlots
--             --     inventoryComponent.InventoryUpdateLocked = true
--             --     inventoryComponent:UpdateInventorySlotCount(targetMaxSlots)
--             -- end
--         end
--         -- if myPlayer.CharacterHotbarInventory:GetAddress() == inventoryComponent:GetAddress() then
--         --     LogDebug("[UpdateInventorySlotCount] called: -----")
--         --     LogDebug("NewMaxSlots: "..newMaxSlots)
--         --     LogDebug("------------------------------")
--         -- end
--     end
-- end)

-- RegisterHook("/Game/Blueprints/Characters/Abiotic_InventoryComponent.Abiotic_InventoryComponent_C:ComputeCurrentInventoryWeight", function(Context, TotalWeight)
--     local inventoryComponent = Context:get() ---@type UAbiotic_InventoryComponent_C
--     local totalWeight = TotalWeight:get()

--     -- local myPlayer = AFUtils.GetMyPlayer()
--     -- if myPlayer and myPlayer.CharacterInventory:IsValid() then
--     --     if myPlayer.CharacterInventory:GetAddress() == inventoryComponent:GetAddress() then
--             LogDebug("[ComputeCurrentInventoryWeight] called: -----")
--             LogDebug("TotalWeight: ", totalWeight)
--             LogDebug("inventoryComponent.CurrentTotalInventoryWeight:", inventoryComponent.CurrentTotalInventoryWeight)
--             LogDebug("------------------------------")
--     --     end
--     -- end
-- end)

-- RegisterHook("/Game/Blueprints/Characters/Abiotic_InventoryComponent.Abiotic_InventoryComponent_C:OnRep_CurrentTotalInventoryWeight", function(Context)
--     local inventoryComponent = Context:get() ---@type UAbiotic_InventoryComponent_C

--     LogDebug("[OnRep_CurrentTotalInventoryWeight] called: -----")
--     LogDebug("inventoryComponent.CurrentTotalInventoryWeight:", inventoryComponent.CurrentTotalInventoryWeight)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Characters/Abiotic_PlayerCharacter.Abiotic_PlayerCharacter_C:Server Refresh New Inventory Weight", function(Context)
--     local playerCharacter = Context:get()

--     LogDebug("----- [Server Refresh New Inventory Weight] called -----")
--     AFUtils.LogPlayerCharacter(playerCharacter)
--     LogDebug("------------------------------")
-- end)


-- RegisterHook("/Game/Blueprints/Characters/Abiotic_PlayerCharacter.Abiotic_PlayerCharacter_C:Refresh Current Max Carry Weight", function(Context)
--     local playerCharacter = Context:get() ---@type AAbiotic_PlayerCharacter_C

--     LogDebug("[Refresh Current Max Carry Weight] called: -----")
--     AFUtils.LogPlayerCharacter(playerCharacter)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Characters/Abiotic_PlayerCharacter.Abiotic_PlayerCharacter_C:Calculate Total Inventory Carry Weight", function(Context)
--     local playerCharacter = Context:get() ---@type AAbiotic_PlayerCharacter_C

--     LogDebug("[Calculate Total Inventory Carry Weight] called: -----")
--     AFUtils.LogPlayerCharacter(playerCharacter)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Environment/Systems/DayNightManager.DayNightManager_C:CheckForWeatherRequest", function(Context, Requested)
--     local dayNightManager = Context:get()
--     local requested = Requested:get()

--     LogDebug("----- [CheckForWeatherRequest] called -----")
--     LogDebug("Requested: " .. tostring(requested))
--     -- AFUtils.LogDayNightManager(dayNightManager)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Environment/Systems/DayNightManager.DayNightManager_C:OnRep_CurrentWeatherEvent", function(Context)
--     local dayNightManager = Context:get()

--     LogDebug("----- [OnRep_CurrentWeatherEvent] called -----")
--     -- AFUtils.LogDayNightManager(dayNightManager)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Environment/Systems/DayNightManager.DayNightManager_C:TriggerWeatherEvent", function(Context, EventRow)
--     local dayNightManager = Context:get()
--     local eventRow = EventRow:get()

--     LogDebug("----- [TriggerWeatherEvent] called -----")
--     LogDebug("EventRow type: " .. eventRow:type())
--     LogDebug("EventRow.RowName: " .. eventRow.RowName:ToString())
--     LogDebug("EventRow.DataTablePath: " .. eventRow.DataTablePath:ToString())
--     -- AFUtils.LogDayNightManager(dayNightManager)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Meta/Abiotic_PlayerController.Abiotic_PlayerController_C:Request_ContinenceReduction", function(Context, SuccessLevel)
--     local playerController = Context:get() ---@type AAbiotic_PlayerController_C
--     local successLevel = SuccessLevel:get() ---@type CriticalityLevels

--     LogDebug("----- [Request_ContinenceReduction] called -----")
--     LogDebug("SuccessLevel:", successLevel)
--     LogDebug("CurrentContinence:", playerController.MyPlayerCharacter.CurrentContinence)
--     LogDebug("------------------------------")
-- end)

-- RegisterHook("/Game/Blueprints/Meta/Abiotic_PlayerController.Abiotic_PlayerController_C:Client_ToggleContinenceMinigame", function(Context, Show)
--     local playerController = Context:get() ---@type AAbiotic_PlayerController_C
--     local show = Show:get() ---@type boolean

--     LogDebug("----- [Client_ToggleContinenceMinigame] called -----")
--     LogDebug("Show:", show)
--     LogDebug("CurrentContinence:", playerController.MyPlayerCharacter.CurrentContinence)
--     -- playerController.MyPlayerCharacter.CurrentContinence = 99
--     -- playerController:Request_ContinenceReduction(AFUtils.CriticalityLevels.Green)
--     LogDebug("------------------------------")
-- end)

LogInfo("Mod loaded successfully")