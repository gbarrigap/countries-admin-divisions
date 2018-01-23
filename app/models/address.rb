class Address < ApplicationRecord
  belongs_to :country_administrative_division
  has_one :country_administrative_level, through: :country_administrative_division
  has_one :country, through: :country_administrative_level

  validates :street_name, presence: true, uniqueness: { scope: [:country_administrative_division, :street_number] }
  validates :street_number, presence: true, uniqueness: { scope: [:country_administrative_division, :street_name] }
end
