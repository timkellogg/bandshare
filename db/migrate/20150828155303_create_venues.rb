class CreateVenues < ActiveRecord::Migration
  def change
  	create_table :venues do |t|
  		t.column :name, :string 
  		t.column :city, :string 
  		t.column :country, :string 
  		t.column :pic_link, :string 
  		t.column :capacity, :integer 
  	end
  end
end
