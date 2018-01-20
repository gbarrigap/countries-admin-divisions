# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
country = Country.create(name: 'Chile', international_name: 'Chile')

first_level  = CountryAdministrativeLevel.create(country: country, level: 1, name: "Región",    international_name: "Region")
second_level = CountryAdministrativeLevel.create(country: country, level: 2, name: "Provincia", international_name: "Province")
third_level  = CountryAdministrativeLevel.create(country: country, level: 3, name: "Comuna",    international_name: "Commune")

region   = CountryAdministrativeDivision.create(country_administrative_level: first_level,                    name: "De Los Ríos")
province = CountryAdministrativeDivision.create(country_administrative_level: second_level, parent: region,   name: "Valdivia")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "Corral")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "Lanco")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "Los")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "Mariquina")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "Máfil")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "Paillaco")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "Panguipulli")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "Valdivia")
province = CountryAdministrativeDivision.create(country_administrative_level: second_level, parent: region,   name: "Del Ranco")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "La Unión")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "Futrono")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "Río Bueno")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "Lago Ranco")

region   = CountryAdministrativeDivision.create(country_administrative_level: first_level,                          name: "Del Biobío")
province = CountryAdministrativeDivision.create(country_administrative_level: first_level,  parent: region,   name: "Concepción")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "Concepción")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "Coronel")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "Chiguayante")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "Florida")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "Hualpén")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "Hualqui")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "Lota")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "Penco")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "San Pedro de la Paz")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "Santa Juana")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "Talcahuano")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "Tomé")

province = CountryAdministrativeDivision.create(country_administrative_level: second_level, parent: region,   name: "Ñuble")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "Chillán")

region   = CountryAdministrativeDivision.create(country_administrative_level: first_level,                          name: "Metropolitana")
province = CountryAdministrativeDivision.create(country_administrative_level: second_level, parent: region,   name: "Santiago")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "Providencia")
commune  = CountryAdministrativeDivision.create(country_administrative_level: third_level,  parent: province, name: "Santiago")

Address.create(street_name: "Avenida Diego de Almagro", street_number: "2074-404", country_administrative_division: commune)
