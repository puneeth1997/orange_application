class AddPointsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :points, :string
  end
end
