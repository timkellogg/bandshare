class CreateBands < ActiveRecord::Migration
  def change
  	create_table :bands do |t|
  		t.column :name, :string 
  		t.column :country_from, :string 
  		t.column :music_style, :string 
  	end
  end
end
