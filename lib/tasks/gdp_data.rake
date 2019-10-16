require 'csv'

namespace :gdp_data do
  desc "This will read from a csv of historical GDP data and will input the data into a database."
  task seed_data: :environment do

    Country.destroy_all

    @x = Dir.entries("lib/assets/API_NY.GDP.PCAP.PP.CD_DS2_en_csv_v2_247784 (1)")

    @x.each do |xx|
      puts xx
    end

    CSV.foreach("lib/assets/API_NY.GDP.PCAP.PP.CD_DS2_en_csv_v2_247784 (1)/Metadata_Indicator_API_NY.GDP.PCAP.PP.CD_DS2_en_csv_v2_247784.csv",
      encoding: "bom|utf-8",
      :headers => true) do |row|

        puts row.inspect #just so that we know the file's being read

        # create new model instances
        Indicator.create!(
          IndicatorCode: row[0],
          IndicatorName: row[1],
          SourceNote: row[2]
        )
    end

    CSV.foreach("lib/assets/API_NY.GDP.PCAP.PP.CD_DS2_en_csv_v2_247784 (1)/Metadata_Country_API_NY.GDP.PCAP.PP.CD_DS2_en_csv_v2_247784.csv",
      encoding: "bom|utf-8",
      :headers => true) do |row|
      puts row.inspect #just so that we know the file's being read

      # create new model instances with the data
      Country.create!(
      CountryCode: row[0],
      Region: row[1],
      IncomeGroup: row[2],
      SpecialNotes: row[3]
      )
    end
  end
end
