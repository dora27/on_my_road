class AddStatusToStop < ActiveRecord::Migration[5.0]
  def change
    add_column :stops, :status, :string, null: false, default: "Pending"
  end
end
