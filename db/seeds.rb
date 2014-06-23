# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# http://placehold.it/450x450

products = []

30.times do |product|
  first, last = ('a'..'z').to_a.shuffle[0..3].join.capitalize, ('a'..'z').to_a.shuffle[0..4].join.capitalize
  description = "Lorem ipsum dolor sit amet, consectetur adipisicing."
  price = rand(1000..20000)
  lorempixel = %w(technics city business cats)
  photo_url = "http://lorempixel.com/450/450/" + lorempixel[(rand(0..3))].to_s + "/" + rand(1..9).to_s + "/"
  new_product = [first + " " + last, description, price, photo_url]
  products.push(new_product)
end

products.each do |name, description, price_in_cents, photo_url|
  Product.create( :name => name,
    :description => description,
    :price_in_cents => price_in_cents,
    :photo_url => photo_url )
end