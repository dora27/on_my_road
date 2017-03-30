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
Request.destroy_all
Review.destroy_all

#Creation des profils users (drivers)
simon = User.new(email: "simon@gmail.com", password: "lewagon", first_name: "Simon", last_name: "DeSwag", phone: "0123456789")
simon.save
url = "https://images.unsplash.com/photo-1462927346281-d1727e290082?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=600&h=600&fit=crop&s=5e38cc09571ee99356fb9cbdae60844e"
simon.photo_url = url

charier = User.new(email: "charier@gmail.com", password: "lewagon", first_name: "Alexandre", last_name: "Charier", phone: "0623752788")
charier.save
url = "https://images.unsplash.com/photo-1482235225574-c37692835cf3?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=600&h=600&fit=crop&s=f5c78b214486b2bcbf480be1ac9e1899"
charier.photo_url = url

quentin = User.new(email: "quentin@gmail.com", password: "lewagon", first_name: "Quentin", last_name: "Beauvais", phone: "0634569345")
quentin.save
url = "https://images.unsplash.com/photo-1474293507615-951863a0f942?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=600&h=600&fit=crop&s=c6ba396f347be3311a819069ffb0a376"
quentin.photo_url = url

dora = User.new(email: "dora@gmail.com", password: "lewagon", first_name: "Dora", last_name: "Crisan", phone: "0695432864")
dora.save
url = "https://images.unsplash.com/photo-1478184096253-c2d96e9263c1?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=600&h=600&fit=crop&s=39b2f181d43e61b22ea5832bf860bacf"
dora.photo_url = url

joe = User.new(email: "joe@gmail.com", password: "lewagon",  first_name: "Joe", last_name: "Berne", phone: "0623000788")
joe.save
url = "https://images.unsplash.com/photo-1484876767844-6a8091de7ccc?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=600&h=600&fit=crop&s=c52e13dfc7b0312af6585b85e9fb553a"
joe.photo_url = url

florian = User.new(email: "florian@gmail.com", password: "lewagon",  first_name: "Florian", last_name: "Stegre", phone: "0623765788")
florian.save
url = "https://images.unsplash.com/photo-1484876767844-6a8091de7ccc?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=600&h=600&fit=crop&s=c52e13dfc7b0312af6585b85e9fb553a"
florian.photo_url = url

#Creation des trajets associés
trajet_simon = Traject.new(seats: 3, starting_address: "12 Boulevard Carnot, 72100 Le Mans" ,start_time: "12:00" ,luggage: 1 ,description: "Swag, fresh and style", user_id: simon.id)
trajet_simon.save
trajet_charier = Traject.new(seats: 3, starting_address: "62 Boulevard du Roi Rene, 49100 Angers" ,start_time: "09:20" ,luggage: 7 ,description: "J'ai une barbe, j'aime les plantes et le cannabis : je suis un hippie", user_id: charier.id)
trajet_charier.save
trajet_quentin = Traject.new(seats: 3, starting_address: "53 Rue Paul Bellamy, 44000 Nantes" ,start_time: "10:40",luggage: 3 ,description: "J'aime beaucoup Nantes et la techno", user_id: quentin.id)
trajet_quentin.save
trajet_dora = Traject.new(seats: 3, starting_address: "4 Rue Saint-Martin, 14000 Caen" ,start_time: "11:30",luggage: 2, user_id: dora.id)
trajet_dora.save
trajet_joe = Traject.new(seats: 3, starting_address: "56 Avenue de Guerland, Paimpol" ,start_time: "14:00",luggage: 3 ,description: "J'aime l'alcool, la mer et les vieilles charrues: je suis bretonne", user_id: joe.id)
trajet_joe.save

#Creation de reviews
Review.new(content: "Hey! Je viens de t'accepter!" , traject_id: trajet_simon.id, user_id: simon.id).save
Review.new(content: "Hey! Je viens de t'accepter!", traject_id: trajet_charier.id, user_id: charier.id).save
Review.new(content: "Hey! Je viens de t'accepter!", traject_id: trajet_quentin.id, user_id: quentin.id).save
Review.new(content: "Hey! Je viens de t'accepter!", traject_id: trajet_dora.id, user_id: dora.id).save
Review.new(content: "Hey! Je viens de t'accepter!", traject_id: trajet_joe.id, user_id: joe.id).save
puts "Seed OK"


