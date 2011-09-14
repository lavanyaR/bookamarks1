class BooksController < ApplicationController
  def index
   @user =User.find(session[:user])
   @books = Book.where(:user_id => @user.id)
   
  end
 def create
   @user =User.find(session[:user])
   @book=Book.new(:title => params[:book][:title],:discription => params[:book][:discription],:url => params[:book][:url],:user_id => @user.id)

        respond_to do |format|
         if @book.save
            format.html { redirect_to users_path }
        else
            format.html{render :action => "new"}
      
       end
    end
 end
 def new
 @book = Book.new
 end
 def show
  @book = Book.find(params[:id])
 end
 def edit
  @book = Book.find(params[:id])
 end
 def update
 puts"$$$$$$$$$$$$$$$$$$$$$$$$$",params
 @book = Book.find(params[:id])
 respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to(users_path, :notice => 'Update was successfully updated.') }
     else
        format.html { render :action => "edit" }
    end
  end
 end
 def destroy
    @book= Book.find(params[:id])
    @book.destroy
   redirect_to users_path
 end


end
