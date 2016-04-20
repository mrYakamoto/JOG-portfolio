require "open-uri"

class Article < ActiveRecord::Base
  belongs_to :publication
  has_attached_file :picture, styles: {thumb: "525x300#"}
  before_create :picture_from_url, :unless => Proc.new { |a| a.image_url == "" }

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  validates_presence_of :publication_id
  validates_presence_of :title
  validates_presence_of :url

  scope :featured_by_priority, -> { where(:featured => 1).order(:priority => :desc) }

  def picture_from_url
    self.picture = URI.parse(self.image_url)
    self.featured = 1
  end

end
