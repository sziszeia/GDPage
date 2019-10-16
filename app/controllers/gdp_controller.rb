class GdpController < ApplicationController
    def gdphome
        @message = "This is GDP page."
        @countries = Country.all
        @indicators = Indicator.all
        @gdps = GdpPc.where(CountryName: 'Aruba')
    end
end
