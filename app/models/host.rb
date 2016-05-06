class Host < ActiveRecord::Base
  belongs_to :user
  has_many :seats
  has_many :riders, through: :seats, source: :user

  validates :seats_available, presence: true
    format: {
      with: /[1-5][0-9]/,
      message: "You've surpassed the maximum passengers allowed."
    }
end
