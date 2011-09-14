class HomeController < ApplicationController
  def index
    @users=User.limit(3)
    @books=Book.order("created_at DESC")
    @bookmarks = Book.paginate(:page => params[:page], :per_page => 1)
    
   
  end
  def viewall
     @users=User.all 
  end
 def show
  @user =User.find(params[:id])
 end


end
