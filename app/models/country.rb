class Country < ApplicationRecord
    belongs_to :GdpPc, optional: true
end
