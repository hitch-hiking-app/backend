class User < ActiveRecord::Base
  belongs_to :profile
  has_many :hosts
  has_many :pictures, as: :imageable
  has_many :seats
  has_many :rides, through: :seats, source: :trip
  has_secure_password
  #has_many :pictures, as: :imageable
  #has_attached_file :image

  #validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :email, presence: true, uniqueness: true,
    format: {
      with: /.+\@.+\..+/,
      message: "must have an @ symbol and period"
    }
  validates :auth_token, presence: true

  validates :seats_available, presence: true




  def ensure_auth_token
    unless self.auth_token
      self.auth_token = User.generate_token
    end
  end

  def self.generate_token
    token = SecureRandom.hex
    while User.exists?(auth_token: token)#making sure no duplicates
      token = SecureRandom.hex
    end
    token
  end
end
