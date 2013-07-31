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
    Country.create!(:name => name, :code => code)
  end
end
