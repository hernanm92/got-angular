json.fuerzas @fuerzas do |fuerza|
  json.extract! fuerza, :type, :cantidad_dragones, :cantidad_soldados, :cantidad_soldados
  json.casa fuerza.casa.nombre
end