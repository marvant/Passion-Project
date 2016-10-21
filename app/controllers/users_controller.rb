
#registration
get '/users/new' do
	erb :'users/new'
end

post '/users' do
	if params[:password] == params[:password_confirm]
		user = User.new(name: params[:name], email: params[:email], password: params[:password])
		if user.save
			session[:user_id] = user.id
		end
	end

	redirect "/"
end


get '/users/:id' do

  #gets params from url

  @user = User.find(params[:id]) #define instance variable for view
  @user_listings = @user.listings
  erb :'users/show' #show single user view

end

