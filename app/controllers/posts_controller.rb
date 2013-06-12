get '/posts/:post_id/comments' do
	@post = Post.find(params[:post_id])
	@comments = @post.comments
	erb :post
end


get '/posts/:post_id/vote' do
  value = params[:vote] == "up" ? 1 : -1
  @post = Post.find(params[:post_id])
  @post.add_or_update_vote(:value, current_user)
  redirect to "/" 
end

get '/posts/new' do
	erb :new_post
end

post '/posts/new' do
	post = Post.new(	:title => params[:title],
										:link_url => params[:link_url],
										:user_id => current_user.id
									)
	if post.save
		redirect to "/posts/#{post.id}/comments"
	else
		errors = {:errors => "stuff"}
	end
end

get '/' do
  if session[:user]
    # redirect to ''
  end
  @posts = Post.limit(30)
	erb :list_posts
end