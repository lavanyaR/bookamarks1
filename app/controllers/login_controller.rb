class LoginController < ApplicationController
 def index
   @user = User.all
  end
  def create
   @user = User.new(params[:user])
   @usr = User.find_all_by_email(@user.email)
   if(!@usr.blank? && @usr.first.password.eql?(@user.password))
    session[:user] = @usr.first.id
    flash[:notice] = "Logged in Successfully"

    redirect_to users_path
   else
    flash[:error] = "Failed to login"
    redirect_to home_index_path
   end
  end
 def logout
  session[:user] = nil if session[:user]
   redirect_to home_index_path
 end
end
