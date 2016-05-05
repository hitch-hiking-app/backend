class Host < ActiveRecord::Base
  belongs_to :user
  has_many :seats
  has_many :riders, through: :seats, source: :user
  geocoded_by :departing_search, :latitude  => :depart_latitude, 
  					    :longitude => :depart_longitude 
  geocoded_by :destination_search, :latitude  => :destination_latitude,
  						:longitude => :destination_longitude
end

