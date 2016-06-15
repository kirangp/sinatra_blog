class Author < ActiveRecord::Base
  has_many :posts
  has_secure_password
  validates_uniqueness_of :email

  


end