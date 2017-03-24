class AddOccursAtStop < ActiveRecord::Migration[5.0]
  def change
    add_column :stops, :occurs_at, :string
  end
end
