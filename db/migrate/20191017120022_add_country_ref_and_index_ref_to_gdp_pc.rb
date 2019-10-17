class AddCountryRefAndIndexRefToGdpPc < ActiveRecord::Migration[5.2]
  def change
    add_reference :gdp_pcs, :Country, foreign_key: true
    add_reference :gdp_pcs, :Index, foreign_key: true
  end
end
