class AddEndTimeStop < ActiveRecord::Migration[5.0]
  def change
    add_column :stops, :end_time, :string
  end
end
