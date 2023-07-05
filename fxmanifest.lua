fx_version 'cerulean'
game 'gta5'
author 'yoyankee'
name 'Hit Marker & Simple Custom Audio Player'
ui_page 'nui/index.html'

client_scripts {
	'client/main.lua',
	'config.lua'
}

shared_scripts 'config.lua'

server_scripts {
	'server/main.lua'
}

files {
	'nui/index.html',
	'nui/js/index.js',
	'nui/audio/*'
}

lua54 'yes'
