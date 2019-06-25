[
  ['グリーンモンスター', 'monster-green.png', 3, 1],
  ['ヘッドホンモンスター', 'monster-pink.png', 5, 1],
  ['ケンタウルス', 'centaur.png', 10, 1],
  ['デーモン', 'demon.png', 12, 1],
  ['トゥーンドラゴン', 'dragon-pop.jpg', 15, 1],
  ['オオカミ男', 'werewolf.png', 20, 2],
  ['ドラゴン使い', 'dragon-woman.png', 25, 2],
  ['メタルドラゴン', 'dragon-brown.png', 30, 2],
  ['ブラックドラゴン', 'dragon-black.png', 40, 3],
  ['森の番人', 'panther.jpg', 50, 3]
].each do |name, image, hp, rank|
  Enemy.create!(
    { name: name, image: image, hp: hp, rank: rank }
  )
end