class Country < ApplicationRecord
  has_many :country_administrative_levels, dependent: :destroy
  has_many :country_administrative_divisions, through: :country_administrative_levels
  has_many :addresses, through: :country_administrative_divisions
end
