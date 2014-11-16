json.heroes @heroes do |heroe|
  json.extract! heroe, :nombre, :poder
  json.casa heroe.casa.nombre
end