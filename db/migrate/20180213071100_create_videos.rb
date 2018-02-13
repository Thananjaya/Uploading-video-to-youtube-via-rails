class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :link
      t.string :title
      t.string :file
      t.string :description
      t.integer :likes
      t.integer :dislikes
      t.datetime :published_at
      t.integer :uid
      t.references :user

      t.timestamps
    end
  end
end
