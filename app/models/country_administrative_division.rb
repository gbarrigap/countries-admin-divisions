class CountryAdministrativeDivision < ApplicationRecord
  belongs_to :country_administrative_level
  has_many :addresses
end
