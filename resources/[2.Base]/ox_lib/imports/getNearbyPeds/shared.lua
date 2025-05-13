--[[
    https://github.com/overextended/ox_lib

    This file is licensed under LGPL-3.0 or higher <https://www.gnu.org/licenses/lgpl-3.0.en.html>

    Copyright © 2025 Linden <https://github.com/thelindat>
]]

---@param coords vector3 The coords to check from.
---@param maxDistance? number The max distance to check.
---@return { ped: number, coords: vector3 }[]
function lib.getNearbyPeds(coords, maxDistance)
    local peds = GetGamePool('CPed')
    local nearby = {}
    local count = 0
    maxDistance = maxDistance or 2.0

    for i = 1, #peds do
        local ped = peds[i]

        if not IsPedAPlayer(ped) then
            local pedCoords = GetEntityCoords(ped)
            local distance = #(coords - pedCoords)

            if distance < maxDistance then
                count += 1
                nearby[count] = {
                    ped = ped,
                    coords = pedCoords,
                }
            end
        end
    end

    return nearby
end

return lib.getNearbyPeds
