get '/categories' do 
	@categories_none_sorted = Category.all
  @categories = @categories_none_sorted.sort { |a,b| a.name.downcase <=> b.name.downcase }
  # @users.sort! { |a,b| a.name.downcase <=> b.name.downcase }
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


get '/categories/new' do

  erb :'categories/new' #show new categories view

end


post '/categories' do

  #below works with properly formatted params in HTML form
  @category = Category.new(name: params[:name], user_id: session[:user_id]) #create new category
    if @category.save #saves new category or returns false if unsuccessful
      if request.xhr?
        erb :'/categories/_category', layout: false, locals: {:category => @category}
      else
        redirect '/categories' #redirect back to categories index page
      end
    else
      erb :'categories/new' # show new categories view again(potentially displaying errors)

  end
end
