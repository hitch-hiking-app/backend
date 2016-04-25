class User < ActiveRecord::Base
  has_many :hosts
end
