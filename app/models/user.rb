class User < ActiveRecord::Base
  has_secure_password
  has_attached_file :picture

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  validates_uniqueness_of :username
end
