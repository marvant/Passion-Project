
#registration
get '/users/new' do
	erb :'users/new'
end

post '/users' do
	if params[:password] == params[:password_confirm]
		user = User.new(name: params[:name], email: params[:email], password: params[:password])
		if user.save
			session[:user_id] = user.id
			redirect "/"
			
		else
			@errors = "Something went wrong, try again."
			erb :'users/new'

		end
	else
		@errors = "confrim your password"
		erb :'users/new'
	end

end


get '/users/:id' do

  #gets params from url

  @user = User.find(params[:id]) #define instance variable for view
  @user_listings = @user.listings

  @user_categories = @user.categories
  erb :'users/show' #show single user view

end

