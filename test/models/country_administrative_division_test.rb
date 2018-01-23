require 'test_helper'

class CountryAdministrativeDivisionTest < ActiveSupport::TestCase

  test 'should not save a division without a level' do
    invalid_division = CountryAdministrativeDivision.create(name: 'De Los Ríos')
    assert_not invalid_division.save
  end

  test 'should not save a division without a name' do
    country = Country.create(name: 'Chile')
    level = CountryAdministrativeLevel.create(country: country, level: 1, name: 'Región')
    parent = CountryAdministrativeDivision.create(country_administrative_level: level, name: 'Del Biobío')
    invalid_division = CountryAdministrativeDivision.create(country_administrative_level: level, parent: parent)
    assert_not invalid_division.save
  end

  test 'should save a division without a parent' do
    country = Country.create(name: 'Chile')
    level = CountryAdministrativeLevel.create(country: country, level: 1, name: 'Región')
    valid_division = CountryAdministrativeDivision.new(country_administrative_level: level, name: 'Del Biobío')
    assert valid_division.save
  end

  test 'different divisions by country can have the same name' do
    country = Country.create(name: 'Chile')
    first_level = CountryAdministrativeLevel.create(country: country, level: 1, name: 'Región')
    second_level = CountryAdministrativeLevel.create(country: country, level: 2, name: 'Provincia')
    third_level = CountryAdministrativeLevel.create(country: country, level: 3, name: 'Comuna')
    valid_first_level_division = CountryAdministrativeDivision.create(country_administrative_level: first_level, name: 'Del Biobío')
    valid_second_level_division = CountryAdministrativeDivision.create(country_administrative_level: second_level, parent: valid_first_level_division, name: 'Concepción')
    valid_third_level_division = CountryAdministrativeDivision.create(country_administrative_level: third_level, parent: valid_second_level_division, name: 'Concepción')
    assert valid_third_level_division.save
  end

  test 'different divisions overall can have the same name' do
    c1 = Country.create(name: 'First Country')
    c2 = Country.create(name: 'Second Country')
    c1_level = CountryAdministrativeLevel.create(country: c1, level: 1, name: 'City')
    c2_level = CountryAdministrativeLevel.create(country: c1, level: 1, name: 'County')
    c1_division = CountryAdministrativeDivision.create(country_administrative_level: c1_level, name: 'Velo City')
    c2_division = CountryAdministrativeDivision.new(country_administrative_level: c2_level, name: 'Velo City')
    assert c2_division.save
  end

  test 'different divisions by country can have the same international name' do
    country = Country.create(name: 'Chile')
    first_level = CountryAdministrativeLevel.create(country: country, level: 1, name: 'Región')
    second_level = CountryAdministrativeLevel.create(country: country, level: 2, name: 'Provincia')
    third_level = CountryAdministrativeLevel.create(country: country, level: 3, name: 'Comuna')
    valid_first_level_division = CountryAdministrativeDivision.create(country_administrative_level: first_level, name: 'Del Biobío')
    valid_second_level_division = CountryAdministrativeDivision.create(country_administrative_level: second_level, parent: valid_first_level_division, name: 'Concepción', international_name: 'Concepción')
    valid_third_level_division = CountryAdministrativeDivision.create(country_administrative_level: third_level, parent: valid_second_level_division, name: 'Concepción', international_name: 'Concepción')
    assert valid_third_level_division.save
  end

  test 'different divisions overall can have the same international_name' do
    c1 = Country.create(name: 'First Country')
    c2 = Country.create(name: 'Second Country')
    c1_level = CountryAdministrativeLevel.create(country: c1, level: 1, name: 'City')
    c2_level = CountryAdministrativeLevel.create(country: c1, level: 1, name: 'County')
    c1_division = CountryAdministrativeDivision.create(country_administrative_level: c1_level, name: 'Velo City', international_name: 'Velo City')
    c2_division = CountryAdministrativeDivision.new(country_administrative_level: c2_level, name: 'Velo City', international_name: 'Velo City')
    assert c2_division.save
  end

end
