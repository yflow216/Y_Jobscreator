fx_version 'cerulean'
game 'gta5'

author 'Y Flow'
description 'https://discord.gg/TjTd9j6UTk'
version '1.0.0'

shared_scripts {
    'config.lua'
}

server_scripts {
    '@es_extended/locale.lua',
    '@mysql-async/lib/MySQL.lua',
    'server/main.lua',
    'server/database.lua',
    'server/discord.lua',
    'admin/commands.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    'client/main.lua',
    'client/ui.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

dependencies {
    'es_extended',
    'mysql-async'
}
