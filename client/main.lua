-- �������+��+�����+��������+������+�  �������+������+��������+
-- ��+----+���������+--��+--+��+--��+  ��+----+��+--��+��+----+
-- �����+��������������������������++  �����+��������+++�����+�
-- ��+--+����������������������+--��+  ��+--+����+---+��+---��+
-- ��������+������++�����������������  ����������������������++
-- +-+������+-----+����+-+���+-+��+-+  +-+�����+-+�����+-----+�

local isMenuOpen = false

function applyCommonOptimizations(ped)
    ClearAllBrokenGlass()
    ClearAllHelpMessages()
    LeaderboardsReadClearAll()
    ClearBrief()
    ClearGpsFlags()
    ClearPrints()
    ClearSmallPrints()
    ClearReplayStats()
    LeaderboardsClearCacheData()
    ClearFocus()
    ClearHdArea()
    ClearPedBloodDamage(ped)
    ClearPedWetness(ped)
    ClearPedEnvDirt(ped)
    ResetPedVisibleDamage(ped)
    ClearOverrideWeather()
    DisableScreenblurFade()
    SetRainLevel(0.0)
    SetWindSpeed(0.0)
end

function applyAdvancedOptimizations()
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            SetPedDensityMultiplierThisFrame(0.5)
            SetVehicleDensityMultiplierThisFrame(0.5)
            SetRandomVehicleDensityMultiplierThisFrame(0.5)
            SetParkedVehicleDensityMultiplierThisFrame(0.5)
            SetScenarioPedDensityMultiplierThisFrame(0.5, 0.5)
            SetAmbientVehicleRangeMultiplierThisFrame(0.5)
            SetAmbientPedRangeMultiplierThisFrame(0.5)
        end
    end)
    
    RemoveParticleFxInRange(0.0, 0.0, 0.0, 10000.0)
end

function applyUltraOptimizations()
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            SetPedDensityMultiplierThisFrame(0.0)
            SetVehicleDensityMultiplierThisFrame(0.0)
            SetRandomVehicleDensityMultiplierThisFrame(0.0)
            SetParkedVehicleDensityMultiplierThisFrame(0.0)
            SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
            SetAmbientVehicleRangeMultiplierThisFrame(0.0)
            SetAmbientPedRangeMultiplierThisFrame(0.0)
        end
    end)
    
    SetPedPopulationBudget(0)
    SetVehiclePopulationBudget(0)
end

function applyPotatoMode()
    SetArtificialLightsState(false)
end

RegisterNUICallback('closeMenu', function(data, cb)
    SetNuiFocus(false, false)
    isMenuOpen = false
    cb('ok')
end)

RegisterNUICallback('applyPreset', function(data, cb)
    local preset = data.preset
    local ped = PlayerPedId()
    
    if preset == "low" then
        SetTimecycleModifier('exile1_plane')
        applyCommonOptimizations(ped)
        activeOptimization = "low"
        TriggerEvent('chat:addMessage', {
            color = {79, 209, 197},
            multiline = true,
            args = {"FUTR-FPS", "Low mode activated - Optimizations applied"}
        })
        
    elseif preset == "rapid" then
        SetTimecycleModifier('yell_tunnel_nodirect')
        applyCommonOptimizations(ped)
        activeOptimization = "rapid"
        TriggerEvent('chat:addMessage', {
            color = {79, 209, 197},
            multiline = true,
            args = {"FUTR-FPS", "Rapid Boost activated - Maximum particle optimization"}
        })
        
    elseif preset == "lowtexture" then
        SetTimecycleModifier('v_janitor')
        applyCommonOptimizations(ped)
        activeOptimization = "lowtexture"
        TriggerEvent('chat:addMessage', {
            color = {79, 209, 197},
            multiline = true,
            args = {"FUTR-FPS", "Low Texture mode activated - Texture quality reduced"}
        })
        
    elseif preset == "nogpu" then
        SetTimecycleModifier('HicksbarNEW')
        applyCommonOptimizations(ped)
        activeOptimization = "nogpu"
        TriggerEvent('chat:addMessage', {
            color = {79, 209, 197},
            multiline = true,
            args = {"FUTR-FPS", "No GPU mode activated - Maximum optimization enabled"}
        })
        
    elseif preset == "ultra" then
        SetTimecycleModifier('MP_Powerplay_blend')
        applyCommonOptimizations(ped)
        SetArtificialLightsState(false)
        activeOptimization = "ultra"
        TriggerEvent('chat:addMessage', {
            color = {79, 209, 197},
            multiline = true,
            args = {"FUTR-FPS", "Ultra Performance mode activated - Extreme optimization applied"}
        })
        
    elseif preset == "graphics" then
        SetTimecycleModifier('v_torture')
        SetExtraTimecycleModifier('reflection_correct_ambient')
        activeOptimization = "graphics"
        TriggerEvent('chat:addMessage', {
            color = {168, 85, 247},
            multiline = true,
            args = {"FUTR-FPS", "Better Graphics applied - Visual quality enhanced"}
        })
        
    elseif preset == "vignette" then
        SetTimecycleModifier('rply_vignette')
        activeOptimization = "vignette"
        TriggerEvent('chat:addMessage', {
            color = {168, 85, 247},
            multiline = true,
            args = {"FUTR-FPS", "Vignette filter applied"}
        })
        
    elseif preset == "blackwhite" then
        SetTimecycleModifier('NG_filmnoir_BW01')
        activeOptimization = "blackwhite"
        TriggerEvent('chat:addMessage', {
            color = {168, 85, 247},
            multiline = true,
            args = {"FUTR-FPS", "Black & White filter applied"}
        })
        
    elseif preset == "sepia" then
        SetTimecycleModifier('NG_filmic19')
        activeOptimization = "sepia"
        TriggerEvent('chat:addMessage', {
            color = {168, 85, 247},
            multiline = true,
            args = {"FUTR-FPS", "Sepia Tone filter applied"}
        })
        
    elseif preset == "cinematic" then
        SetTimecycleModifier('MP_corona_switch')
        SetExtraTimecycleModifier('cinema')
        activeOptimization = "cinematic"
        TriggerEvent('chat:addMessage', {
            color = {168, 85, 247},
            multiline = true,
            args = {"FUTR-FPS", "Cinematic filter applied"}
        })
        
    elseif preset == "vibrant" then
        SetTimecycleModifier('MP_Powerplay_blend')
        SetExtraTimecycleModifier('MP_Powerplay')
        activeOptimization = "vibrant"
        TriggerEvent('chat:addMessage', {
            color = {168, 85, 247},
            multiline = true,
            args = {"FUTR-FPS", "Vibrant filter applied - Colors enhanced"}
        })
        
    elseif preset == "reset" then
        SetTimecycleModifier()
        ClearTimecycleModifier()
        ClearExtraTimecycleModifier()
        SetArtificialLightsState(true)
        activeOptimization = nil
        TriggerEvent('chat:addMessage', {
            color = {239, 68, 68},
            multiline = true,
            args = {"FUTR-FPS", "All settings reset to default"}
        })
    end
    
    cb('ok')
end)

function applyCommonOptimizations(ped)
    ClearAllBrokenGlass()
    ClearAllHelpMessages()
    LeaderboardsReadClearAll()
    ClearBrief()
    ClearGpsFlags()
    ClearPrints()
    ClearSmallPrints()
    ClearReplayStats()
    LeaderboardsClearCacheData()
    ClearFocus()
    ClearHdArea()
    ClearPedBloodDamage(ped)
    ClearPedWetness(ped)
    ClearPedEnvDirt(ped)
    ResetPedVisibleDamage(ped)
    ClearOverrideWeather()
    DisableScreenblurFade()
    SetRainLevel(0.0)
    SetWindSpeed(0.0)
end

function applyAdvancedOptimizations()
    SetPedDensityMultiplierThisFrame(0.5)
    SetVehicleDensityMultiplierThisFrame(0.5)
    SetRandomVehicleDensityMultiplierThisFrame(0.5)
    SetParkedVehicleDensityMultiplierThisFrame(0.5)
    SetScenarioPedDensityMultiplierThisFrame(0.5, 0.5)
    
    SetAmbientVehicleRangeMultiplierThisFrame(0.5)
    SetAmbientPedRangeMultiplierThisFrame(0.5)
    
    RemoveParticleFxInRange(0.0, 0.0, 0.0, 10000.0)
end

function applyUltraOptimizations()
    SetPedDensityMultiplierThisFrame(0.0)
    SetVehicleDensityMultiplierThisFrame(0.0)
    SetRandomVehicleDensityMultiplierThisFrame(0.0)
    SetParkedVehicleDensityMultiplierThisFrame(0.0)
    SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
    
    SetAmbientVehicleRangeMultiplierThisFrame(0.0)
    SetAmbientPedRangeMultiplierThisFrame(0.0)
    
    SetPedPopulationBudget(0)
    SetVehiclePopulationBudget(0)
end

function applyPotatoMode()
    SetArtificialLightsState(false)
    CascadeShadowsClearShadowSampleType()
    CascadeShadowsSetType(0)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        if activeOptimization == "low" or activeOptimization == "rapid" or activeOptimization == "lowtexture" then
            SetPedDensityMultiplierThisFrame(0.5)
            SetVehicleDensityMultiplierThisFrame(0.5)
            SetRandomVehicleDensityMultiplierThisFrame(0.5)
            SetParkedVehicleDensityMultiplierThisFrame(0.5)
            SetScenarioPedDensityMultiplierThisFrame(0.5, 0.5)
            SetAmbientVehicleRangeMultiplierThisFrame(0.5)
            SetAmbientPedRangeMultiplierThisFrame(0.5)
            
        elseif activeOptimization == "nogpu" or activeOptimization == "ultra" then
            SetPedDensityMultiplierThisFrame(0.0)
            SetVehicleDensityMultiplierThisFrame(0.0)
            SetRandomVehicleDensityMultiplierThisFrame(0.0)
            SetParkedVehicleDensityMultiplierThisFrame(0.0)
            SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
            SetAmbientVehicleRangeMultiplierThisFrame(0.0)
            SetAmbientPedRangeMultiplierThisFrame(0.0)
        end
    end
end)

RegisterCommand("fps", function()
    if not isMenuOpen then
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "openMenu"
        })
        isMenuOpen = true
    end
end)

RegisterKeyMapping('fps', 'Open FPS Menu', 'keyboard', 'F12')
