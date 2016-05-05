class AddAttachmentPictureToArticles < ActiveRecord::Migration
  def self.up
    add_attachment :articles, :picture
  end

  def self.down
    remove_attachment :articles, :picture
  end
end