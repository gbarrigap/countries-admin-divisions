class CreateCountryAdministrativeLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :country_administrative_levels do |t|
      t.references :country, foreign_key: true
      t.integer :level
      t.string :name
      t.string :international_name

      t.timestamps
    end
  end
end
