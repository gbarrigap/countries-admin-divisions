class CountryAdministrativeLevel < ApplicationRecord
  belongs_to :country
  has_many :country_administrative_divisions
end
