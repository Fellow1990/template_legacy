fx_version 'cerulean'

game 'gta5'
lua54 'yes'

description 'FW Announce'

version '1.0.0'

shared_scripts {
	'@ox_lib/init.lua',
	'@es_extended/imports.lua',
    'shared/*.lua'
}

server_scripts {
    'server/*.lua'
}

client_scripts {
    'client/*.lua'
}