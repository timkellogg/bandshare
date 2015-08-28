class AddAttendanceToConcerts < ActiveRecord::Migration
  def change
  	add_column :concerts, :attendance, :integer
  end
end
