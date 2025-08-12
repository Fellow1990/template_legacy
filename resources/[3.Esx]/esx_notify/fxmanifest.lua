fx_version 'adamant'

lua54 'yes'
game 'gta5'
version '1.13.1'
author 'ESX-Framework'
description 'A beautiful and simple NUI notification system for ESX'

shared_script '@es_extended/imports.lua'

client_scripts { 'Config.lua', 'Notify.lua'}

ui_page 'nui/index.html'

files {
    'nui/index.html',
    'nui/js/*.js',
    'nui/css/*.css',
}
