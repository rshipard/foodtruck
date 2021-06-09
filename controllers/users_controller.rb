get '/sign_up' do
    erb :'/users/new'
end

post '/user' do
    email = params[:email]
    password = params[:password]
  
    create_user(email, password)
  
    redirect '/'
end
