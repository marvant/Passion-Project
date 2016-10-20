get '/listings' do
	erb :'/listings/index'
end

get '/listings/new' do 
	@categories = Category.all
	erb :'/listings/new'
end

post '/listings' do
	@category = Category.find_by_name(params[:category])

	@listing = Listing.new(title: params[:name], address: params[:address], website: params[:website], phone: params[:phone], user_id: session[:user_id], category_id: @category.id)
	@listing.save
	redirect "/listings/#{@listing.id}"
end

delete '/categories/:category_id/listings/:id' do 

  @category = Category.find(params[:category_id])

  @listing = @category.listings.find(params[:id])

  p @listing.title
  p @category.id 

  @listing.destroy



  redirect "/users/#{@listing.user.id}"

end

get '/categories/:category_id/listings/:id/edit' do

  @category = Category.find(params[:category_id])

  @listing = @category.listings.find(params[:id])

  erb :'listings/edit'

end

put '/categories/:category_id/listings/:id' do

  @category = Category.find(params[:category_id])
  p @category

  @listing = @category.listings.find(params[:id])

  @user_id = @listing.user.id

  if @listing.update_attributes(category_id: params[:category_id], title: params[:name], address: params[:address], website: params[:website], phone: params[:phone])

    redirect "/users/#{@user_id}"
  else 
    erb :'listings/edit' #show edit listings view again(potentially displaying errors)
  end

end


