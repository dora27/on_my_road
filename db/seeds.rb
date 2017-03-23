# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Traject.destroy_all
#Creation des profils users (drivers)
simon = User.new(email: "simon@gmail.com", password: "lawagon1", first_name: "Simon", last_name: "DeSwag", phone: "0123456789")
simon.save
stegre = User.new(email: "virtualflow@gmail.com", password: "lawagon2", first_name: "VirtualFlow", last_name: "Stegre", phone: "0623752788")
stegre.save
quentin = User.new(email: "quentinbeau@gmail.com", password: "lawagon3", first_name: "Quentin", last_name: "BoV", phone: "0634569345")
quentin.save
dora = User.new(email: "dora@gmail.com", password: "lawagon4", first_name: "Dora", phone: "0695432864")
dora.save
alix = User.new(email: "alix@gmail.com", password: "lawagon5",  first_name: "Alix", phone: "0623000788")
alix.save

#Creation des trajets associés
Traject.new(seats: 3, starting_address: "12 Boulevard Carnot, 72100 Le Mans" ,luggage: 1 ,description: "Swag, fresh and style", user_id: simon.id).save
Traject.new(seats: 3, starting_address: "62 Boulevard du Roi Rene, 49100 Angers" ,luggage: 7 ,description: "J'ai une barbe, j'aime les plantes et le cannabis : je suis un hippie", user_id: stegre.id).save
Traject.new(seats: 3, starting_address: "53 Rue Paul Bellamy, 44000 Nantes" ,luggage: 3 ,description: "J'aime beaucoup Nantes et la techno", user_id: quentin.id).save
Traject.new(seats: 3, starting_address: "4 Rue Saint-Martin, 14000 Caen" ,luggage: 2, user_id: dora.id).save
Traject.new(seats: 3, starting_address: "56 Avenue de Guerland, Paimpol" ,luggage: 3 ,description: "J'aime l'alcool, la mer et les vieilles charrues: je suis bretonne", user_id: alix.id).save




