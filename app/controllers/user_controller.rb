get '/users/new' do
	erb :'users/new'
end

get '/mainpage' do
	@user = User.find(session[:user_id])
	erb :'dynamic/mainpage'
end

post '/users' do
	@user = User.new(params[:user])
	if @user.save
		session[:user_id] = @user.id
		redirect to '/mainpage'
	else
		redirect to '/error'
	end
end

delete '/users/destroy' do
	session[:user_id] = nil
	redirect to '/'
end

get '/login' do
	erb :'users/login'
end

post '/login' do
	@user = User.find_by(email: params[:user][:email])
	if @user && @user.authenticate(params[:user][:password])
		session[:user_id] = @user.id
		redirect to '/mainpage'
	else
		redirect to '/error'
	end
end

