get '/properties/new' do
	erb :'properties/new'
end

get '/properties' do
	@properties = Property.all
	erb :'properties/properties'
end

get '/properties/:property_id' do
	@property = Property.find(params[:property_id])
	erb :'properties/properties'
end

get '/properties/:property_id/edit' do
	@property = Property.find(params[:property_id])
	erb :'properties/edit'
end

patch '/properties/:property_id' do
	@property = Property.find(params[:property_id])
	@property.update(params[:property])
	erb :"properties/properties"
end

post '/properties' do
	@property = Property.new(params[:property])
	@property[:user_id] = session[:user_id]
	if @property.save
		redirect to "/properties/#{@property.id}"
	else
		@flash = "#{@property.errors.full_messages}"
		erb :'properties/new'
	end
end

delete '/properties/:property_id' do
	@property = Property.find(params[:property_id])
	@property.destroy
	redirect to "/properties"
end