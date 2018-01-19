class CreateCountryAdministrativeDivisions < ActiveRecord::Migration[5.1]
  def change
    create_table :country_administrative_divisions do |t|
      t.references :country_administrative_level, index: { name: "index_country_admin_level_id" }
      t.integer :first_level_id
      t.integer :second_level_id
      t.integer :third_level_id
      t.integer :fourth_level_id
      t.string :name
      t.string :international_name

      t.timestamps
    end
  end
end
