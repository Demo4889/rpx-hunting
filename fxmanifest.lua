fx_version "cerulean"
game "rdr3"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author "Demo"
description "Hunting/Butcher for RPX Base"
version "0.0.1"

shared_scripts {
	'@ox_lib/init.lua',
	'lang.lua',
	'init.lua',
	'shared/*.lua',
}

client_script 'client.lua'

server_script 'server.lua'

lua54 'yes'

dependencies {
	'rpx-core',
	'ox_lib'
}