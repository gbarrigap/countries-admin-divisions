require 'test_helper'

class CountryAdministrativeLevelTest < ActiveSupport::TestCase

  test 'should not save country admin level without a country' do
    level = CountryAdministrativeLevel.new(name: 'Chile')
    assert_not level.save
  end

  test 'should not save country admin level without a name' do
    chile = Country.create(name: 'Chile')
    level = CountryAdministrativeLevel.new(country: chile)
    assert_not level.save
  end

  test 'should not save country admin level with a blank name' do
    chile = Country.create(name: 'Chile')
    level = CountryAdministrativeLevel.new(country: chile, name: '')
    assert_not level.save
  end

  test 'different levels by country should not have the same administrative level names' do
    chile = Country.create(name: 'Chile')
    chilean_first_admin_level = CountryAdministrativeLevel.create(country: chile, level: 1, name: 'Región')
    chilean_second_admin_level = CountryAdministrativeLevel.new(country: chile, level: 2, name: 'Región')
    assert_not chilean_second_admin_level.save
  end

  test 'different levels by country should not have the same administrative level international names' do
    chile = Country.create(name: 'Chile')
    chilean_first_admin_level = CountryAdministrativeLevel.create(country: chile, level: 1, name: 'Región', international_name: 'Region')
    chilean_second_admin_level = CountryAdministrativeLevel.new(country: chile, level: 2, name: 'Provincia', international_name: 'Region')
    assert_not chilean_second_admin_level.save
  end

  test 'different countries should be able to have the same administrative level names' do
    chile = Country.create(name: 'Chile')
    peru = Country.create(name: 'Perú')
    chilean_first_admin_level = CountryAdministrativeLevel.create(country: chile, level: 1, name: 'Región')
    peruvian_first_admin_level = CountryAdministrativeLevel.new(country: peru, level: 1, name: 'Región')
    assert peruvian_first_admin_level.save
  end

  test 'different countries should be able to have the same administrative level international names' do
    chile = Country.create(name: 'Chile')
    peru = Country.create(name: 'peru')
    chilean_first_admin_level = CountryAdministrativeLevel.create(country: chile, level: 1, name: 'Región', international_name: 'Region')
    peruvian_first_admin_level = CountryAdministrativeLevel.new(country: peru, level: 1, name: 'Maakuntaa', international_name: 'Region')
    assert peruvian_first_admin_level.save
  end

end
