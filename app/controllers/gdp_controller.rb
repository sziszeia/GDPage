class GdpController < ApplicationController
    include ActionView::Helpers::NumberHelper
    
    def gdphome
        @message = "This is GDP page."
        @countries = Country.all
        @indicators = Indicator.all
        @gdps = GdpPc.all # where(CountryName: 'Aruba')
        @gdp = @gdps[15]
        @indicator = Indicator.all[0]
        # Get the years from 2000 to 2018 for which we have the data in the csv
        @years = []
        18.times do |i|
            @years.push(2000 + i)
        end

        @country = Country.where(CountryCode: 'GBR').take

        @annual_gdp = []
        @annual_gdp.push(@gdp.Y2000)
        @annual_gdp.push(@gdp.Y2001)
        @annual_gdp.push(@gdp.Y2002)
        @annual_gdp.push(@gdp.Y2003)
        @annual_gdp.push(@gdp.Y2004)
        @annual_gdp.push(@gdp.Y2005)
        @annual_gdp.push(@gdp.Y2006)
        @annual_gdp.push(@gdp.Y2007)
        @annual_gdp.push(@gdp.Y2008)
        @annual_gdp.push(@gdp.Y2009)
        @annual_gdp.push(@gdp.Y2010)

    end
end
