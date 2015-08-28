class CreateConcerts < ActiveRecord::Migration
  def change
  	create_table :concerts do |t|
  		t.belongs_to :band, index: true 
  		t.belongs_to :venue, index: true 
  		t.column :played_at, :boolean 
  		t.timestamps null: false 
  	end
  end
end
