class CreateIndicators < ActiveRecord::Migration[5.2]
  def change
    create_table :indicators do |t|
      t.string :IndicatorCode
      t.string :IndicatorName
      t.string :SourceNote

      t.timestamps
    end
  end
end
