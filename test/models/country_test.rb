require 'test_helper'

class CountryTest < ActiveSupport::TestCase

  test 'should not save country without a name' do
    country = Country.new
    assert_not country.save
  end

  test 'should not save country with a blank name' do
    country = Country.new(name: '')
    assert_not country.save
  end

  test 'countries should have unique names' do
    unique_country = Country.new(name: 'Chile')
    existing_country = Country.new(name: unique_country.name)
    unique_country.save
    assert_not existing_country.save
  end

  test 'countries should have unique international names' do
    unique_country = Country.new(name: 'Chile', international_name: 'Chile')
    existing_country = Country.new(name: 'Chili', international_name: unique_country.international_name)
    unique_country.save
    assert_not existing_country.save
  end

end
