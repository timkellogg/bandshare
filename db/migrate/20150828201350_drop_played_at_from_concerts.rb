class DropPlayedAtFromConcerts < ActiveRecord::Migration
  def change
  	remove_column :concerts, :played_at
  end
end
