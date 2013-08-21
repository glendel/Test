# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'

Type.delete_all
["Cedula", "Cedula Extranjera", "Tarjeta de Identidad", "Registro Civil", "Pasaporte", "Adulto Sin Identificacion", "Menor Sin Identificacion", "Numero Unico de Identificacion"].each do |type|
  Type.create!(:name => type)
end

Country.delete_all
open("http://openconcept.ca/sites/openconcept.ca/files/country_code_drupal_0.txt") do |countries|
  countries.read.each_line do |country|
    code, name = country.chomp.split("|")
    Country.create!(:name => name, :code => code.strip)
  end
end

Departament.delete_all
open("db/departaments.txt") do |departaments|
  departaments.read.each_line do |departament|
    code, name, country_id = departament.chomp.split("|")
    Departament.create!(:name => name, :code => code, :country_id => country_id.strip)
  end
end

City.delete_all
open("db/cities.txt") do |cities|
  cities.read.each_line do |city|
    city_id, depart_id, name, cap = city.chomp.split("|")
    City.create!(:code => city_id.to_i, :name => name, :depart_id => depart_id.to_i, :cap => cap)
  end
end