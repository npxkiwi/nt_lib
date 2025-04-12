fx_version 'cerulean'
game 'gta5'

Author '._.notepad'
Description 'Make it easy to create FiveM resources.'
Version '1.0.0'

client_scripts {
    'resource/client/client.lua',
}

server_scripts {
    'resource/server/server.lua',
}

files {
    'init.lua',
    'modules/**/shared.lua',
    'modules/**/client.lua',
    'modules/**/server.lua',
}

shared_scripts {
    'resource/init.lua',
}

lua54 'yes'