fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name ""
author "Scube Scripts"
version "1.0.5"
description ""

client_scripts {
  'client.lua',
}
  
server_scripts {
  'server.lua',
  }

shared_script {
  '@ox_lib/init.lua',
  'config.lua'
}

dependencies {
  'es_extended',
	'ox_lib',
  'oxmysql',
  'ox_inventory'
}