# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# name, image, hp, rank
[
  ['monster-green', '/public/enemy/monster-green.png', 3, 1],
  ['monster-pink', '/public/enemy/monster-pink.png', 5, 1],
  ['angry_boss', '/public/enemy/angry_boss.jpg', 8, 1],
  ['centaur', '/public/enemy/centaur.png', 10, 1],
  ['demon', '/public/enemy/demon.png', 12, 1],
  ['dragon-pop', '/public/enemy/dragon-pop.jpg', 15, 1],
  ['werewolf', '/public/enemy/werewolf.png', 20, 2],
  ['dragon-woman', '/public/enemy/dragon-woman.png', 25, 2],
  ['dragon-brown', '/public/enemy/dragon-brown.png', 30, 2],
  ['dragon-black', '/public/enemy/dragon-black.png', 40, 3],
  ['panther', '/public/enemy/panther.jpg', 50, 3]
].each do |name, image, hp, rank|
  Enemy.create!(
    { name: name, image: image, hp: hp, rank: rank }
  )
end