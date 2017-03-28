class AddStartTimeTraject < ActiveRecord::Migration[5.0]
  def change
    add_column :trajects, :start_time, :string
  end
end
