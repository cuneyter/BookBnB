class CreateFlats < ActiveRecord::Migration[6.1]
  def change
    create_table :flats do |t|
      t.string :address_line_1
      t.string :address_line_2
      t.string :postcode
      t.string :city
      t.string :state
      t.integer :price
      t.integer :max_guest_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
