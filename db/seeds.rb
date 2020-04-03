# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

scripts = [
    {title:'Hello', author:'Allan', email:'ajd2215'},
    {title:'World', author:'Allan', email:'ajd2215'},
    {title:'Cat Boy', author:'Jami', email:'jjb2230'},
    {title:'Fa and the Bois', author:'Faboi', email:'faf6969'},
    {title:'The Settlers of Catan', author:'Ari', email:'ajt2222'},
    {title:'A Simple Love Story', author:'Austin Ebel', email:'uhhhs'},
]

scripts.each do |script|
    Script.create!(script)
end