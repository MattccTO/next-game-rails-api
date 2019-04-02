# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding Data..."

def open_asset(file_name)
    File.open(Rails.root.join('db', 'assets', 'sport-image', file_name))
end

unless Rails.env.development?
    puts "Development seeds only (for now)!"
    exit 0
end

puts "Re-creating Facilities..."

#Delete everything first
Game.destroy_all
Facility.destroy_all
Sport.destroy_all

#make new seed users
facility1 = Facility.create!({
    name: "Christie Pits Park",
    latitude: 43.6646,
    longitude: -79.4207,
})

facility2 = Facility.create!({
    name: "Dovercourt Park",
    latitude: 43.6658,
    longitude: -79.4338,
})

facility3 = Facility.create!({
    name: "Grange Park",
    latitude: 43.6537,
    longitude: -79.3930,
})

facility4 = Facility.create!({
    name: "Inukshuk Park",
    latitude: 43.6324,
    longitude: -79.4095,
})

facility5 = Facility.create!({
    name: "Village of Yorkville Park",
    latitude: 43.6700,
    longitude: -79.3917,
})

puts "Re-creating Sports..."


basketball = Sport.create!({
    name: "Basketball",
    image: 'https://github.com/MattccTO/next-game-rails-api/blob/master/db/assets/sport-image/pickupBasketball.jpg?raw=true'
})

frisbee = Sport.create!({
    name: "Frisbee",
    image: 'https://github.com/MattccTO/next-game-rails-api/blob/master/db/assets/sport-image/pickupFrisbee.jpeg?raw=true'
})

soccer = Sport.create!({
    name: "Soccer",
    image: 'https://github.com/MattccTO/next-game-rails-api/blob/master/db/assets/sport-image/pickupSoccer.jpg?raw=true'
})

tennis = Sport.create!({
    name: "Tennis",
    image: 'https://github.com/MattccTO/next-game-rails-api/blob/master/db/assets/sport-image/pickupTennis.jpg?raw=true'
})

volleyball = Sport.create!({
    name: "Volleyball",
    image: 'https://github.com/MattccTO/next-game-rails-api/blob/master/db/assets/sport-image/pickupVolleyball.png?raw=true'
})

puts "Joining Facilities and Sports..."

facility1.sport_ids = Sport.first.id, (Sport.first.id + 1), (Sport.first.id + 2)
facility1.save

facility2.sport_ids = Sport.first.id, (Sport.first.id + 1), (Sport.first.id + 2), (Sport.first.id + 3)
facility2.save

facility3.sport_ids = (Sport.first.id + 4), (Sport.first.id + 3), Sport.first.id
facility3.save

facility4.sport_ids = Sport.first.id, (Sport.first.id + 1), (Sport.first.id + 2), (Sport.first.id + 3), (Sport.first.id + 4)
facility4.save

facility5.sport_ids = Sport.first.id, (Sport.first.id + 3), (Sport.first.id + 4)
facility5.save

puts "Re-creating Users..."

User.destroy_all

user1 = User.create!({
    username: "Test",
    email: "test@email.com",
    password: 'password',
    image: 'none'
})

user2 = User.create!({
    username: "User2",
    email: "user2@email.com",
    password: 'password',
    image: 'none'
})

user3 = User.create!({
    username: "User3",
    email: "user3@email.com",
    password: 'password',
    image: 'none'
})

user4 = User.create!({
    username: "User4",
    email: "user4@email.com",
    password: 'password',
    image: 'none'
})

user5 = User.create!({
    username: "User5",
    email: "user5@email.com",
    password: 'password',
    image: 'none'
})

puts "Re-creating Games..."


game1 = Game.create!({
    date: '2019-04-01',
    start_time: '12:00:00',
    facility_id: Facility.first.id,
    sport_id: Sport.first.id
})

game2 = Game.create!({
    date: '2019-04-01',
    start_time: '14:00:00',
    facility_id: (Facility.first.id + 1),
    sport_id: (Sport.first.id + 1)
})

game3 = Game.create!({
    date: '2019-04-03',
    start_time: '08:30:00',
    facility_id: (Facility.first.id + 2),
    sport_id: (Sport.first.id + 2)
})

game4 = Game.create!({
    date: '2019-04-02',
    start_time: '16:00:00',
    facility_id: (Facility.first.id + 3),
    sport_id: (Sport.first.id + 3)
})

game5 = Game.create!({
    date: '2019-04-02',
    start_time: '18:00:00',
    facility_id: (Facility.first.id + 4),
    sport_id: (Sport.first.id + 4)
})

puts "Joining Games and Users..."

game1.user_ids = User.first.id, (User.first.id + 1), (User.first.id + 2)
game1.save

game2.user_ids = User.first.id, (User.first.id + 2), (User.first.id + 4)
game2.save

game3.user_ids = (User.first.id + 4), (User.first.id + 2)
game3.save

game4.user_ids = User.first.id, (User.first.id + 3)
game4.save

game5.user_ids = (User.first.id + 4), (User.first.id + 1), (User.first.id + 2)
game5.save


puts "Joining Sports and Users..."

basketball.user_ids = User.first.id, (User.first.id + 1)
basketball.save

frisbee.user_ids = (User.first.id + 2), (User.first.id + 3)
frisbee.save

soccer.user_ids = User.first.id, (User.first.id + 3), (User.first.id + 2)
soccer.save

tennis.user_ids = (User.first.id + 1), (User.first.id + 3)
tennis.save

volleyball.user_ids = (User.first.id + 1), (User.first.id + 4)
volleyball.save

puts "done!"
