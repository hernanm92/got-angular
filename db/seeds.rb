# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

casas = ['Bolton', 'Lannister', 'Baratheon', 'Stark', 'Greyjoy', 'Martell', 
 'Targaryen', 'Tully', 'Frey', 'Tyrell']

casas.each do |nombre| 
  
  Casa.find_or_create_by({
    nombre: nombre,
    patrimonio: Random.rand(10000..100000),
    fundada_en: Random.rand(100..1000)
  })
end

['Tyrion', 'Jamie', 'Cercei', 'Bronn','The Hound','The Mountain', 'Tywin', 'Joffrey'].each do |nombre|
  Heroe.find_or_create_by({
    nombre: nombre,
    poder: Random.rand(1..100),
    casa: Casa.find_by(nombre: 'Lannister')
  })
end

['Daenerys', 'Daario Naharis', 'Jorah Mormont', 'Barristan Selmy', 'Grey Worm'].each do |nombre|
  Heroe.find_or_create_by({
    nombre: nombre,
    poder: Random.rand(1..100),
    casa: Casa.find_by(nombre: 'Targaryen')
  })
end

['Jon Snow','Sansa', 'Arya', 'Bran','Catelyn','Robb', 'Ned'].each do |nombre|
  Heroe.find_or_create_by({
    nombre: nombre,
    poder: Random.rand(1..100),
    casa: Casa.find_by(nombre: 'Stark')
  })
end

['Margaery', 'Olenna', 'Mace', 'Loras'].each do |nombre|
  Heroe.find_or_create_by({
    nombre: nombre,
    poder: Random.rand(1..100),
    casa: Casa.find_by(nombre: 'Tyrell')
  })
end

['Stannis','Renly','Robert'].each do |nombre|
  Heroe.find_or_create_by({
    nombre: nombre,
    poder: Random.rand(1..100),
    casa: Casa.find_by(nombre: 'Baratheon')
  })
end

['Theon', 'Balon', 'Asha'].each do |nombre|
  Heroe.find_or_create_by({
    nombre: nombre,
    poder: Random.rand(1..100),
    casa: Casa.find_by(nombre: 'Greyjoy')
  })
end

['Ramsay', 'Roose'].each do |nombre|
  Heroe.find_or_create_by({
    nombre: nombre,
    poder: Random.rand(1..100),
    casa: Casa.find_by(nombre: 'Bolton')
  })
end

['Walder', 'Lame', 'Black'].each do |nombre|
  Heroe.find_or_create_by({
    nombre: nombre,
    poder: Random.rand(1..100),
    casa: Casa.find_by(nombre: 'Frey')
  })
end

['Doran', 'Oberyn', 'Ellaria', 'Nymeria'].each do|nombre|
  Heroe.find_or_create_by({
    nombre: nombre,
    poder: Random.rand(1..100),
    casa: Casa.find_by(nombre: 'Martell')
  })
end

['Edmure'].each do |nombre|
  Heroe.find_or_create_by({
    nombre: nombre,
    poder: Random.rand(1..100),
    casa: Casa.find_by(nombre: 'Tully')
  })
end

20.times do 
  Aerea.create({
    cantidad_dragones: Random.rand(5),
    casa: Casa.find_by(nombre: casas.sample)
  })
end

20.times do 
  Naval.create({
    cantidad_barcos: Random.rand(10),
    casa: Casa.find_by(nombre: casas.sample)
  })
end

20.times do 
  Terrestre.create({
    cantidad_soldados: Random.rand(100),
    casa: Casa.find_by(nombre: casas.sample)
  })
end