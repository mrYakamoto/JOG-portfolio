class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.string :image_url

      t.integer :publication_id

      t.timestamps null: false
    end
  end
end