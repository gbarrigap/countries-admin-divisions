class Country < ApplicationRecord
  has_many :country_administrative_levels, dependent: :destroy
  has_many :country_administrative_divisions, through: :country_administrative_levels
  has_many :addresses, through: :country_administrative_divisions

  validates :name, presence: true, uniqueness: true
  validates :international_name, uniqueness: true, allow_nil: true

  before_save :nil_if_blank

  protected

    #
    # If the international_name is set to a blank value, it is changed to nil,
    # in order to allow the record to be saved, since non nil blank values,
    # such as the empty string, will be considered duplicated by the underlying
    # database unique constraint associated with this column.
    #
    def nil_if_blank
      self.international_name = nil if international_name.blank?
    end

end
