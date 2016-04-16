require "open-uri"

class Article < ActiveRecord::Base
  belongs_to :publication
  has_attached_file :picture, styles: {thumb: "525x300#"}
  before_create :picture_from_url

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  validates_presence_of :publication_id

  scope :by_priority, -> { order(:priority => :desc) }

  def picture_from_url
    self.picture = URI.parse(self.image_url)
  end

end
