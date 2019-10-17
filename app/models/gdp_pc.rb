class GdpPc < ApplicationRecord
    has_many :countries
    has_many :indicators
end
