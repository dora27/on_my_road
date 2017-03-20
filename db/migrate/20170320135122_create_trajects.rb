class CreateTrajects < ActiveRecord::Migration[5.0]
  def change
    create_table :trajects do |t|
      t.integer :seats
      t.string :starting_address
      t.integer :luggage
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
