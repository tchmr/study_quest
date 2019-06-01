# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# name, image, hp, rank
[
  ['グリーンモンスター', 'monster-green.png', 3, 1],
  ['ヘッドホンモンスター', 'monster-pink.png', 5, 1],
  ['不機嫌な上司', 'angry_boss.jpg', 8, 1],
  ['ケンタウルスのカップル', 'centaur.png', 10, 1],
  ['デーモン', 'demon.png', 12, 1],
  ['トゥーンドラゴン', 'dragon-pop.jpg', 15, 1],
  ['オオカミ男', 'werewolf.png', 20, 2],
  ['ドラゴン使い', 'dragon-woman.png', 25, 2],
  ['メタルドラゴン', 'dragon-brown.png', 30, 2],
  ['ブラックドラゴン', 'dragon-black.png', 40, 3],
  ['圧倒的な絶望', '/public/enemy/panther.jpg', 50, 3]
].each do |name, image, hp, rank|
  Enemy.create!(
    { name: name, image: image, hp: hp, rank: rank }
  )
end