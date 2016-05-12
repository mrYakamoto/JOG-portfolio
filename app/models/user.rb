class User < ActiveRecord::Base
  has_secure_password
  has_attached_file :picture,
  :storage => :s3,
  :bucket => 'jason-pictures',
  :s3_protocol => :https,
  :s3_host_name => 's3-us-west-2.amazonaws.com'

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  validates_uniqueness_of :username


end
