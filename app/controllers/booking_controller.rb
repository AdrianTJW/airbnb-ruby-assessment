
get '/user/:user_id/bookings' do
	@user = User.find(session[:user_id])
	@bookings = Booking.where(user_id: @user.id)
	erb :'users/my_bookings'
end

get '/properties/:property_id/bookings' do
	@user = User.find(session[:user_id])
	@property = Property.find(params[:property_id])
	if @user.id == @property.user.id
		@flash = "You can't book your own property!"
		erb :'properties/properties'
	else
		erb :'users/bookings'
	end
end

get '/bookings/:booking_id/edit' do
	@booking = Booking.find(params[:booking_id])
	erb :'users/edit'
end

patch '/bookings/:booking_id' do
	byebug
	@booking = Booking.find(params[:booking_id])
	@booking.update(params[:booking])
	redirect to '/mainpage'
end

post '/properties/:property_id/bookings' do
	@booking = Booking.new(params[:booking])
	@booking[:user_id] = session[:user_id]
	@booking[:property_id] = params[:property_id]
	@booking[:booked] = true
	if @booking.save
		redirect to '/mainpage'
	else
		@flash = "#{@booking.errors.full_messages}"
		erb :'users/bookings'
	end
end

delete '/bookings/:booking_id/destroy' do
	@booking = Booking.find(params[:booking_id])
	@booking.destroy
	redirect to '/mainpage'
end