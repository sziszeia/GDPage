class UpdateCountryCodeTypeToString < ActiveRecord::Migration[5.2]
  def up
    change_column :countries, :CountryCode, :string
  end
  
  def down
    change_column :countries, :CountryCode, :integer
  end
end
