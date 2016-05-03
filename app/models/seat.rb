class Seat < ActiveRecord::Base
	belongs_to :host
	belongs_to :user
end
