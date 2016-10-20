get '/categories' do 
	@categories = Category.all
	erb :'/categories/index'
end

get '/categories/:category_id/listings' do 

  @category = Category.find(params[:category_id])

  @listings = @category.listings

  erb :'listings/index'

end

get '/categories/:category_id/listings/new' do 

  @category = Category.find(params[:category_id])

  erb :'listings/new'

end

get '/categories/:category_id/listings/:id' do 

  @category = Category.find(params[:category_id])

  @listing = @category.listings.find(params[:id])

  erb :'listings/show'

end