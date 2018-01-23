class CountryAdministrativeDivision < ApplicationRecord
  belongs_to :country_administrative_level
  belongs_to :parent, class_name: "CountryAdministrativeDivision", optional: true
  has_one :country, through: :country_administrative_level
  has_many :addresses, dependent: :destroy
  has_many :children, class_name: "CountryAdministrativeDivision", foreign_key: "parent_id", dependent: :destroy

  validates :country_administrative_level, presence: true
  validates :name, presence: true
end
