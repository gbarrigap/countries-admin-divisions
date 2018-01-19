# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
country = Country.create(name: 'Chile', international_name: 'Chile')

region   = CountryAdministrativeLevel.create(country: country, level: 1, name: "Región", international_name: "Region")
province = CountryAdministrativeLevel.create(country: country, level: 2, name: "Provincia", international_name: "Province")
commune  = CountryAdministrativeLevel.create(country: country, level: 3, name: "Comuna", international_name: "Commune")

d = CountryAdministrativeDivision.create(country_administrative_level: region,   first_level_id: 1, name: "De Los Ríos")
d = CountryAdministrativeDivision.create(country_administrative_level: province, first_level_id: 1, second_level_id: 1, name: "Valdivia")
d = CountryAdministrativeDivision.create(country_administrative_level: commune,  first_level_id: 1, second_level_id: 1, third_level_id: 1, name: "Corral")
d = CountryAdministrativeDivision.create(country_administrative_level: commune,  first_level_id: 1, second_level_id: 1, third_level_id: 2, name: "Lanco")
d = CountryAdministrativeDivision.create(country_administrative_level: commune,  first_level_id: 1, second_level_id: 1, third_level_id: 3, name: "Los")
d = CountryAdministrativeDivision.create(country_administrative_level: commune,  first_level_id: 1, second_level_id: 1, third_level_id: 4, name: "Mariquina")
d = CountryAdministrativeDivision.create(country_administrative_level: commune,  first_level_id: 1, second_level_id: 1, third_level_id: 5, name: "Máfil")
d = CountryAdministrativeDivision.create(country_administrative_level: commune,  first_level_id: 1, second_level_id: 1, third_level_id: 6, name: "Paillaco")
d = CountryAdministrativeDivision.create(country_administrative_level: commune,  first_level_id: 1, second_level_id: 1, third_level_id: 7, name: "Panguipulli")
d = CountryAdministrativeDivision.create(country_administrative_level: commune,  first_level_id: 1, second_level_id: 1, third_level_id: 8, name: "Valdivia")
d = CountryAdministrativeDivision.create(country_administrative_level: province, first_level_id: 1, second_level_id: 2, name: "Del Ranco")
d = CountryAdministrativeDivision.create(country_administrative_level: commune,  first_level_id: 1, second_level_id: 2, third_level_id: 1, name: "La Unión")
d = CountryAdministrativeDivision.create(country_administrative_level: commune,  first_level_id: 1, second_level_id: 2, third_level_id: 2, name: "Futrono")
d = CountryAdministrativeDivision.create(country_administrative_level: commune,  first_level_id: 1, second_level_id: 2, third_level_id: 3, name: "Río Bueno")
d = CountryAdministrativeDivision.create(country_administrative_level: commune,  first_level_id: 1, second_level_id: 2, third_level_id: 4, name: "Lago Ranco")

d = CountryAdministrativeDivision.create(country_administrative_level: region,   first_level_id: 2, name: "Del Biobío")
d = CountryAdministrativeDivision.create(country_administrative_level: region,   first_level_id: 2, second_level_id: 1, name: "Concepción")
d = CountryAdministrativeDivision.create(country_administrative_level: commune,  first_level_id: 2, second_level_id: 1, third_level_id: 1, name: "Concepción")
d = CountryAdministrativeDivision.create(country_administrative_level: commune,  first_level_id: 2, second_level_id: 1, third_level_id: 2, name: "Coronel")
d = CountryAdministrativeDivision.create(country_administrative_level: commune,  first_level_id: 2, second_level_id: 1, third_level_id: 3, name: "Chiguayante")
d = CountryAdministrativeDivision.create(country_administrative_level: commune,  first_level_id: 2, second_level_id: 1, third_level_id: 4, name: "Florida")
d = CountryAdministrativeDivision.create(country_administrative_level: commune,  first_level_id: 2, second_level_id: 1, third_level_id: 5, name: "Hualpén")
d = CountryAdministrativeDivision.create(country_administrative_level: commune,  first_level_id: 2, second_level_id: 1, third_level_id: 6, name: "Hualqui")
d = CountryAdministrativeDivision.create(country_administrative_level: commune,  first_level_id: 2, second_level_id: 1, third_level_id: 7, name: "Lota")
d = CountryAdministrativeDivision.create(country_administrative_level: commune,  first_level_id: 2, second_level_id: 1, third_level_id: 8, name: "Penco")
d = CountryAdministrativeDivision.create(country_administrative_level: commune,  first_level_id: 2, second_level_id: 1, third_level_id: 9, name: "San Pedro de la Paz")
d = CountryAdministrativeDivision.create(country_administrative_level: commune,  first_level_id: 2, second_level_id: 1, third_level_id: 10, name: "Santa Juana")
d = CountryAdministrativeDivision.create(country_administrative_level: commune,  first_level_id: 2, second_level_id: 1, third_level_id: 11, name: "Talcahuano")
d = CountryAdministrativeDivision.create(country_administrative_level: commune,  first_level_id: 2, second_level_id: 1, third_level_id: 12, name: "Tomé")

d = CountryAdministrativeDivision.create(country_administrative_level: province, first_level_id: 2, second_level_id: 2, name: "Ñuble")
d = CountryAdministrativeDivision.create(country_administrative_level: commune,  first_level_id: 2, second_level_id: 2, third_level_id: 1, name: "Chillán")

d = CountryAdministrativeDivision.create(country_administrative_level: region,   first_level_id: 3, name: "Metropolitana")
d = CountryAdministrativeDivision.create(country_administrative_level: province, first_level_id: 3, second_level_id: 1, name: "Santiago")
d = CountryAdministrativeDivision.create(country_administrative_level: commune,  first_level_id: 3, second_level_id: 1, third_level_id: 1, name: "Providencia")

Address.create(street_name: "Avenida Diego de Almagro", street_number: "2074-404", country_administrative_division: d)
