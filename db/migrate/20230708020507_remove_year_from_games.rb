class RemoveYearFromGames < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :year, :integer
    remove_column :games, :rating, :integer
    remove_column :games, :review, :text
    remove_column :games, :developer, :string
  end
end
