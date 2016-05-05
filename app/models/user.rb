class User < ActiveRecord::Base
  has_secure_password
  has_attached_file :picture,
  :bucket => 'jason-pictures',
  :s3_region => 'Oregon',
  :s3_protocol => :https

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  validates_uniqueness_of :username
end
