class CountryAdministrativeDivision < ApplicationRecord
  belongs_to :country_administrative_level
  belongs_to :parent, class_name: "CountryAdministrativeDivision"
  has_one :country, through: :country_administrative_level
  has_many :addresses
  has_many :children, class_name: "CountryAdministrativeDivision", foreign_key: "parent_id"
end
