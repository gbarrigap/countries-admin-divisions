class Address < ApplicationRecord
  belongs_to :country_administrative_division
  has_one :country_administrative_level, through: :country_administrative_division
  has_one :country, through: :country_administrative_level
end
