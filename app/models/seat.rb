class Seat < ActiveRecord::Base
	belongs_to :host
	belongs_to :user
	# validates :user_id, presence: true, uniqueness: true
end
