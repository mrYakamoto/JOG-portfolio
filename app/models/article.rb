require "open-uri"

class Article < ActiveRecord::Base
  belongs_to :publication
  has_attached_file :picture, styles: {thumb: "525x300#"}

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  validates_presence_of :publication_id

  def picture_from_url(url)
    self.picture = URI.parse(url)
  end
end
