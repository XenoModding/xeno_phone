resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Simple Phone by ChatGPT'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

client_script 'client/main.lua'
server_script '@mysql-async/lib/MySQL.lua'
server_script 'server/main.lua'
shared_script 'config.lua'
