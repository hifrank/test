require 'sinatra'

get '/check-login.js' do
if request.cookies["logon"] == 'yes'
 "checkLogin( { 'logon': true, 'crm-token': 'adasdadsdas', 'user-profile': { 'nickname': 'frank' } } );"
else 
 "checkLogin( { 'logon': false, 'crm-token': '', 'user-profile': { 'nickname': '' } } );"
end
end

get '/sigin' do
  response.set_cookie('logon', 'yes')
  "hi, frank, you have logon~"
end


get '/sigout' do
  response.set_cookie('logon', 'no')
  "hi, frank, you have logout!"
end
run Sinatra::Application
