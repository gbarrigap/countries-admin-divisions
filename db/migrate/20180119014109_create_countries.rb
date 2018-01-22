class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :name, index: { unique: true }
      t.string :international_name, index: { unique: true }

      t.timestamps
    end
  end
end
