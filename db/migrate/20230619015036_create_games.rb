class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :title
      t.text :image
      t.integer :year
      t.string :genre
      t.integer :rating
      t.text :review
      t.string :developer
      t.string :platform
      t.integer :user_id

      t.timestamps
    end
  end
end
