class User < ActiveRecord::Base
   has_many :books,:dependent => :destroy
   email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :name, :presence => true
   validates :password, :presence => true, :length => { :maximum => 5 }
   validates :email, :presence => true, :format   => { :with => email_regex }
end
