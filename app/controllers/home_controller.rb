class HomeController < ApplicationController
  def index
    @users=User.limit(3).order("created_at DESC")
    @books=Book.order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
  end
  def viewall
     @users=User.all 
  end
 def show
  @user =User.find(params[:id])
  @books=Book.order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
 end


end
