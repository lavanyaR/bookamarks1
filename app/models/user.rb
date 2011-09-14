class User < ActiveRecord::Base
  has_many :books
  validates :name,  :presence => true
end
