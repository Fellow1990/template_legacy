--[[
    https://github.com/overextended/ox_lib

    This file is licensed under LGPL-3.0 or higher <https://www.gnu.org/licenses/lgpl-3.0.en.html>

    Copyright © 2025 Linden <https://github.com/thelindat>
]]

---Load a texture dictionary. When called from a thread, it will yield until it has loaded.
---@param textureDict string
---@param timeout number? Approximate milliseconds to wait for the dictionary to load. Default is 10000.
---@return string textureDict
function lib.requestStreamedTextureDict(textureDict, timeout)
    if HasStreamedTextureDictLoaded(textureDict) then return textureDict end

    if type(textureDict) ~= 'string' then
        error(("expected textureDict to have type 'string' (received %s)"):format(type(textureDict)))
    end

    return lib.streamingRequest(RequestStreamedTextureDict, HasStreamedTextureDictLoaded, 'textureDict', textureDict, timeout)
end

return lib.requestStreamedTextureDict
