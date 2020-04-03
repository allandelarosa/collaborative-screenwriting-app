# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
    {username:'Allan', email:'ajd2215', password:'asdf', password_confirmation:'asdf'},
    {username:'Jami', email:'jjb2230', password:'asdf', password_confirmation:'asdf'},
    {username:'Faboi', email:'fa2505', password:'asdf', password_confirmation:'asdf'},
    {username:'Ari', email:'ajt2190', password:'asdf', password_confirmation:'asdf'},
    {username:'Austin', email:'abe2122', password:'asdf', password_confirmation:'asdf'},
]

users.each do |user_params|
    user = User.new(user_params)
    user.save
end

scripts = [
    {title:'Hello', author:'Allan', user_id:1},
    {title:'World', author:'Allan', user_id:1},
    {title:'Cat Boy', author:'Jami', user_id:2},
    {title:'Fa and the Bois', author:'Faboi', user_id:3},
    {title:'The Settlers of Catan', author:'Ari', user_id:4},
    {title:'A Simple Love Story', author:'Austin', user_id:5},
]

scripts.each do |script|
    Script.create!(script)
end