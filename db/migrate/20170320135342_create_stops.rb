class CreateStops < ActiveRecord::Migration[5.0]
  def change
    create_table :stops do |t|
      t.timestamps :occurs_at
      t.string :stop_address
      t.references :traject, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
