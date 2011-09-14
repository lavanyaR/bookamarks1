class UsersController < ApplicationController
  def index
     @user =User.find(session[:user])
     @books = Book.where(:user_id => @user.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
     
     
  end

  def show
   @book = Book.find(params[:id])
  end

  def edit
  @user = User.find(params[:id])
  end

  def new
  @book = Book.new
  end
  def create
   if (params[:user][:password] == params[:confirmpassword])

        @user=User.new(:name => params[:user][:name],:email => params[:user][:email],:password => params[:user][:password])

        respond_to do |format|
         if @user.save
            format.html { redirect_to thanq_users_path }
            
        else
            format.html{render :action => "register"}
      
       end
    end
   else
       redirect_to register_users_path, :notice =>'*password should match'
  end
 
  end
def update
  puts "sssssssSSSSS"
   @user = User.find(params[:id])
   puts "rrrrrrrrrrrrrrr"
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(users_path, :notice => 'Your changes are succesfully updated.') }
     else
        format.html { render :action => "edit" }
    end
  end
  end
def destroy
    puts "hhh"
   @user = User.find(params[:id])   
   @user.destroy
   redirect_to delete_users_path
  end
 def register
 @user=User.new 
 end
 def delete
 end
 def profile
  @user =User.find(session[:user])
 end

end
