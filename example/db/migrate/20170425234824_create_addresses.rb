class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :zipcode
      t.string :neighborhood
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
