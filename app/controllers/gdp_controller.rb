class GdpController < ApplicationController
    include ActionView::Helpers::NumberHelper
    
    def gdphome
        # Get all values from the db that we will need on the page
        @countries = Country.all        
        @indicators = Indicator.all
        @gdps = GdpPc.all 

        # Setup chart        
        # Get country codes for the drop down
        @country_names = []

        @countries.each do |country|
            @country_names.push(country.CountryCode)
        end 

        # Get the years from 2000 to 2018 for which we have the data in the csv
        @years = []
        18.times do |i|
            @years.push(2000 + i)
        end

        # Populate @country with GBR as default or by passed in params
        if params[:SelectCountry].blank?
            @country = @countries.where(CountryCode: 'GBR').take
        else
            @country = @countries.where(CountryCode: params[:SelectCountry]).take
        end

        # Once @country is known we need the associated gdp data and indicator
        @gdp = @gdps.where(CountryCode: @country.CountryCode).take
        @indicator = @indicators.where(IndicatorCode: @gdp.IndicatorCode).take

        # Get GDP per year for the selected country
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
        @annual_gdp.push(@gdp.Y2011)
        @annual_gdp.push(@gdp.Y2012)
        @annual_gdp.push(@gdp.Y2013)
        @annual_gdp.push(@gdp.Y2014)
        @annual_gdp.push(@gdp.Y2015)
        @annual_gdp.push(@gdp.Y2016)
        @annual_gdp.push(@gdp.Y2017)
        @annual_gdp.push(@gdp.Y2018)

    end
end
