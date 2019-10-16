class GdpController < ApplicationController
    def gdphome
        @message = "This is GDP page."
        @countries = Country.all
        @indicators = Indicator.all
    end
end
