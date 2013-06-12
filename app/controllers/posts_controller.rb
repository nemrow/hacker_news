get '/posts/:post_id/comments' do
	@post = Post.find(params[:post_id])
	@comments = @post.comments
end

get '/posts/:post_id/new' do
	
end

post '/posts/:post_id/new' do
	post = Post.new(	:title => params[:title],
										:link_url => params[:link_url],
										:user_id => current_user.id
									)
	if post.save
		redirect to "/posts/#{params[:post]}/comments"
	else
		errors = {:errors => "stuff"}
	end
end

get '/' do
	@posts = Post.limit(30)
	erb :list_posts
end