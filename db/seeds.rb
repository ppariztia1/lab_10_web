# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# ===== Users =====
User.create!([
  { email: "admin@example.com", password: "123456", role: :admin },
  { email: "pedro@example.com", password: "123456", role: :normal },
  { email: "juan@example.com", password: "123456", role: :normal }
])

puts "Users created: #{User.count}"

# ===== Recipes =====
Recipe.create!([
  {
    title: "Agua hervida",
    cook_time: 5,
    difficulty: "easy",
    instructions: "Ponle empeño: agarra una olla, échale agua (ojalá de la llave, no de la piscina), prende la cocina y espera a que hierva. Cuando veas burbujitas (o el hervidor se apague en su defecto), felicítate: lo lograste. No todos llegan tan lejos en la vida.",
    user: User.find_by(email: "pedro@example.com")
  },
  {
    title: "Plátano con manjar",
    cook_time: 2,
    difficulty: "easy",
    instructions: "Pelai el plátano con la elegancia que te caracteriza, le echai una cucharada generosa de manjar arriba y te lo comís con orgullo. 
                    Alta cocina chilena, papá. No se necesita más.",
    user: User.find_by(email: "juan@example.com")
  },
  {
    title: "Completo italiano",
    cook_time: 10,
    difficulty: "medium",
    instructions: "Sácate un pan de hotdog bien apirulado, unas salchichas de chillán, y encima le tirai la palta como si fuerai chef. 
                    Después mayo, tomate, y si querís un toque pro, un chorrito de ají.
                    Si creí que el Boris debería tener un segundo periodo, le podi echar ketchup pa que nadie quiera comer.
                    ... Y saabe perro, caballo.",
    user: User.find_by(email: "pedro@example.com")
  },
  {
    title: "Mejor preentreno ever",
    cook_time: 2,
    difficulty: "easy",
    instructions: "Agarrai una marraqueta, la partes como si estuvierai en la última cena y después la ahuecai.
                    Con una bolsa de manjar, rellenai la marraqueta a gusto, y pa adentro nomas.
                    Con eos carbohidratos y esa azucar, vas a quedar #ModoBestia en el gym.",
    user: User.find_by(email: "juan@example.com")
  }
])

puts "Recipes created: #{Recipe.count}"
puts "Seed listo"


