class Host < ActiveRecord::Base
  belongs_to :user
  has_many :seats
  has_many :riders, through: :seats, source: :user

  #   def seats_left
  #     self.total_seats - self.riders.count
  #   end
  # end
  #
  #
  # if @host.seats_left > 0
  #   @host.riders.new = ....
  # else
  #   render json: {errors: "Sorry, this ride is full."}
end
