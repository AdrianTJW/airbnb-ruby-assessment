get '/comments/:comment_id' do
	@comment = Comment.find(params[:comment_id])
	@property = @comment.property
	erb :"properties/properties"
end

get '/comments/:comment_id/edit' do
	@comment = Comment.find(params[:comment_id])
	erb :'comments/edit'
end

patch '/comments/:comment_id' do
	@comment = Comment.find(params[:comment_id])
	@comment.update(comments: params[:comments])
	@property = @comment.property
	erb :"properties/properties"
end

post '/property/:property_id/comments' do
	@property = Property.find(params[:property_id])
	@comment = @property.comments.create(user_id: session[:user_id], property_id: params[:property_id], comments: params[:comment])
	redirect to "/comments/#{@comment.id}"
end

delete '/comments/:comment_id' do
	@comment = Comment.find(params[:comment_id])
	@comment.destroy
	@property = @comment.property
	erb :"properties/properties"
end