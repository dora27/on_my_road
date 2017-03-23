class AddMessageToStop < ActiveRecord::Migration[5.0]
  def change
    add_column :stops, :message, :string, null: false, default: "Puis-je monter dans ta vago ?"
  end
end
