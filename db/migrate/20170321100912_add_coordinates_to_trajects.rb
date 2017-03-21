class AddCoordinatesToTrajects < ActiveRecord::Migration[5.0]
  def change
    add_column :trajects, :latitude, :float
    add_column :trajects, :longitude, :float
  end
end
