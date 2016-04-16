class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.string :image_url
      t.integer :featured
      t.integer :priority, { default: 0 }
      t.integer :publication_id

      t.timestamps null: false
    end
  end
end