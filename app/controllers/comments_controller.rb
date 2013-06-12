post '/post/:post_id/comments/new' do
	comment = Comment.new(	:post_id => params[:post_id],
													:text => params[:text],
													:user_id => current_user.id
												)
	if comment.save
		redirect to "/posts/#{comment.post_id}/comments"
	else
		@errors = comment.errors
	end	
end