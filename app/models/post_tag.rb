class PostTag < ActiveRecord::Base
  belongs_to :post
  belongs_to :tag

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end