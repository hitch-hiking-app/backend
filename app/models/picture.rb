class Picture < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  has_attached_file :image

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/ 
end
