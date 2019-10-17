require 'csv'

namespace :gdp_data do
  desc "This will read from a csv of historical GDP data and will input the data into a database."
  task seed_data: :environment do

    Country.destroy_all
    Indicator.destroy_all
    GdpPc.destroy_all

    # @filesInDirectory = Dir.entries("lib/assets/API_NY.GDP.PCAP.PP.CD_DS2_en_csv_v2_247784 (1)")

    # @filesInDirectory.each do |file|
    #   puts file
    # end

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

    CSV.foreach("lib/assets/API_NY.GDP.PCAP.PP.CD_DS2_en_csv_v2_247784 (1)/API_NY.GDP.PCAP.PP.CD_DS2_en_csv_v2_247784.csv",
    encoding: "bom|utf-8",
    :headers => true).with_index do |row, i|

      # As this csv file has a few rows on top which are not of interest for the app, they are skipped through
      # until the first data row
      next if i <= 3
      
      country = Country.where(CountryCode: row[1]).take
      if country
        puts country.CountryCode
        puts country.id
      else
        puts "No data for country here"
      end

      indicator = Indicator.where(IndicatorCode: row[3]).take
      if indicator
        puts indicator.IndicatorCode
        puts indicator.id
      else
        puts "No data for indicator here"
      end

      puts row.inspect #just so that we know the file's being read

      # create new model instances
      u = GdpPc.create!(
        CountryName: row[0],
        CountryCode: row[1],
        IndicatorName: row[2],
        IndicatorCode: row[3],
        Y2000: row[44],
        Y2001: row[45],
        Y2002: row[46],
        Y2003: row[47],
        Y2004: row[48],
        Y2005: row[49],
        Y2006: row[50],
        Y2007: row[51],
        Y2008: row[52],
        Y2009: row[53],
        Y2010: row[54],
        Y2011: row[55],
        Y2012: row[56],
        Y2013: row[57],
        Y2014: row[58],
        Y2015: row[59],
        Y2016: row[60],
        Y2017: row[61],
        Y2018: row[62],
        Country_id: country&.id,
        Index_id: indicator&.id
      )

      # Below could help identifying potential issues 
      # puts u.valid?
      # puts u.errors.messages
    end
  end
end
