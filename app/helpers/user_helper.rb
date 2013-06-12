def current_user
 @user ||= User.find(session[:user])
end