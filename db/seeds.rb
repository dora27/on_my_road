# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Stop.destroy_all
Review.destroy_all
Traject.destroy_all
User.destroy_all

#Creation des profils users (drivers)
simon = User.new(email: "simon@gmail.com", password: "lewagon1", first_name: "Simon", last_name: "DeSwag", phone: "0123456789")
simon.save
url = "http://lorempixel.com/400/400/people/1/"
simon.photo_url = url

stegre = User.new(email: "stegre@gmail.com", password: "lewagon2", first_name: "VirtualFlow", last_name: "Stegre", phone: "0623752788")
stegre.save
url = "http://lorempixel.com/400/400/people/2/"
stegre.photo_url = url

quentin = User.new(email: "quentin@gmail.com", password: "lewagon3", first_name: "Quentin", last_name: "BoV", phone: "0634569345")
quentin.save
url = "http://lorempixel.com/400/400/people/3/"
quentin.photo_url = url

dora = User.new(email: "dora@gmail.com", password: "lewagon4", first_name: "Dora", phone: "0695432864")
dora.save
url = "http://lorempixel.com/400/400/people/4/"
dora.photo_url = url

alix = User.new(email: "alix@gmail.com", password: "lewagon5",  first_name: "Alix", phone: "0623000788")
alix.save
url = "http://lorempixel.com/400/400/people/5/"
alix.photo_url = url

#Creation des trajets associés
trajet_simon = Traject.new(seats: 3, starting_address: "12 Boulevard Carnot, 72100 Le Mans" ,start_time: "12:00" ,luggage: 1 ,description: "Swag, fresh and style", user_id: simon.id)
trajet_simon.save
trajet_stegre = Traject.new(seats: 3, starting_address: "62 Boulevard du Roi Rene, 49100 Angers" ,start_time: "09:20" ,luggage: 7 ,description: "J'ai une barbe, j'aime les plantes et le cannabis : je suis un hippie", user_id: stegre.id)
trajet_stegre.save
trajet_quentin = Traject.new(seats: 3, starting_address: "53 Rue Paul Bellamy, 44000 Nantes" ,start_time: "10:40",luggage: 3 ,description: "J'aime beaucoup Nantes et la techno", user_id: quentin.id)
trajet_quentin.save
trajet_dora = Traject.new(seats: 3, starting_address: "4 Rue Saint-Martin, 14000 Caen" ,start_time: "11:30",luggage: 2, user_id: dora.id)
trajet_dora.save
trajet_alix = Traject.new(seats: 3, starting_address: "56 Avenue de Guerland, Paimpol" ,start_time: "14:00",luggage: 3 ,description: "J'aime l'alcool, la mer et les vieilles charrues: je suis bretonne", user_id: alix.id)
trajet_alix.save

#Creation de reviews
Review.new(content: "Pour réagir face à la crise conjoncturelle, il faut de toute urgence avoir à l'esprit la majorité des améliorations opportunes, si l'on veut s'en sortir un jour." , traject_id: trajet_simon.id, user_id: simon.id).save
Review.new(content: "Considérant l'orientation générale, il serait bon de comprendre chacune des solutions draconiennes, depuis longtemps.", traject_id: trajet_stegre.id, user_id: stegre.id).save
Review.new(content: "Compte tenu de la restriction que nous constatons, il ne faut pas s'interdire de fédérer systématiquement les ouvertures possibles, pour le futur.", traject_id: trajet_quentin.id, user_id: quentin.id).save
Review.new(content: "Malgré l'inconstance actuelle, je n'exclus pas d'arrêter de stigmatiser chacune des issues envisageables, depuis longtemps.", traject_id: trajet_dora.id, user_id: dora.id).save
Review.new(content: "Où que nous mène la fragilité actuelle, je n'exclus pas de prendre en compte chacune des voies s'offrant à nous, parce que les mêmes causes produisent les mêmes effets.", traject_id: trajet_alix.id, user_id: alix.id).save
puts "Seed OK"


