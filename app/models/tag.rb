class Tag < ActiveRecord::Base
  validates_presence_of :name
  has_many :post_tags
  has_many :posts, :through => :post_tags

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end