class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.integer :CountryCode
      t.string :Region
      t.string :IncomeGroup
      t.string :SpecialNotes

      t.timestamps
    end
  end
end
