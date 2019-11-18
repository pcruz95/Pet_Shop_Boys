class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false
      t.string :description
      t.string :photo
      t.string :address
      t.integer :price
      t.string :animal_type

      t.timestamps
    end
  end
end
