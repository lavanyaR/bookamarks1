class Book < ActiveRecord::Base
  belongs_to :user
   validates :title, :presence => true
   validates :discription, :presence => true, :length => { :minimum => 5 }
   validates  :url, :presence => true

 
end
