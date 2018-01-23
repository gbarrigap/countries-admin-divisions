require 'test_helper'

class AddressTest < ActiveSupport::TestCase

  test 'should not save address without a country admin division' do
    address = Address.new(street_name: 'Acacia Avenue', street_number: '22')
    assert_not address.save
  end

  test 'should not save address without a street name' do
    country = Country.create(name: 'Chile')
    first_level = CountryAdministrativeLevel.create(country: country, level: 1, name: 'Región')
    second_level = CountryAdministrativeLevel.create(country: country, level: 2, name: 'Provincia')
    third_level = CountryAdministrativeLevel.create(country: country, level: 3, name: 'Comuna')
    first_division = CountryAdministrativeDivision.create(country_administrative_level: first_level, name: 'Del Biobío')
    second_division = CountryAdministrativeDivision.create(country_administrative_level: second_level, parent: first_division, name: 'Concepción')
    third_division = CountryAdministrativeDivision.create(country_administrative_level: third_level, parent: second_division, name: 'Concepción')
    address = Address.new(country_administrative_level: third_level, street_number: '1171')
    assert_not address.save
  end

  test 'should not save address without a street number' do
    country = Country.create(name: 'Chile')
    first_level = CountryAdministrativeLevel.create(country: country, level: 1, name: 'Región')
    second_level = CountryAdministrativeLevel.create(country: country, level: 2, name: 'Provincia')
    third_level = CountryAdministrativeLevel.create(country: country, level: 3, name: 'Comuna')
    first_division = CountryAdministrativeDivision.create(country_administrative_level: first_level, name: 'Del Biobío')
    second_division = CountryAdministrativeDivision.create(country_administrative_level: second_level, parent: first_division, name: 'Concepción')
    third_division = CountryAdministrativeDivision.create(country_administrative_level: third_level, parent: second_division, name: 'Concepción')
    address = Address.new(country_administrative_level: third_level, street_name: 'Virginio Gómez')
    assert_not address.save
  end

  test 'street name/number combination should be unique within a country administrative division' do
    country = Country.create(name: 'Chile')
    first_level = CountryAdministrativeLevel.create(country: country, level: 1, name: 'Región')
    second_level = CountryAdministrativeLevel.create(country: country, level: 2, name: 'Provincia')
    third_level = CountryAdministrativeLevel.create(country: country, level: 3, name: 'Comuna')
    first_division = CountryAdministrativeDivision.create(country_administrative_level: first_level, name: 'Del Biobío')
    second_division = CountryAdministrativeDivision.create(country_administrative_level: second_level, parent: first_division, name: 'Concepción')
    third_division = CountryAdministrativeDivision.create(country_administrative_level: third_level, parent: second_division, name: 'Concepción')
    valid_address = Address.create(country_administrative_division: third_division, street_name: 'Virginio Gómez', street_number: '1171')
    invalid_address = Address.new(country_administrative_division: third_division, street_name: 'Virginio Gómez', street_number: '1171')
    assert_not invalid_address.save
  end

  test 'street name/number combination can be the same for two different administrative divisions' do
    country_one = Country.create(name: 'Country One')
    country_two = Country.create(name: 'Country Two')

    country_one_first_level = CountryAdministrativeLevel.create(country: country_one, level: 1, name: 'Country One First Level')
    country_one_first_division = CountryAdministrativeDivision.create(country_administrative_level: country_one_first_level, name: 'Country One First Level Division')

    country_two_first_level = CountryAdministrativeLevel.create(country: country_two, level: 1, name: 'Country Two First Level')
    country_two_first_division = CountryAdministrativeDivision.create(country_administrative_level: country_two_first_level, name: 'Country Two First Level Division')

    Address.create(country_administrative_division: country_one_first_division, street_name: 'Same Street Name', street_number: '1111')
    valid_address = Address.new(country_administrative_division: country_two_first_division, street_name: 'Same Street Name', street_number: '1111')
    assert valid_address.save
  end

end
