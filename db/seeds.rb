# frozen_string_literal: true

# Nuke db
PokemonMove.destroy_all
PokemonType.destroy_all
Move.destroy_all
Pokemon.destroy_all
Type.destroy_all
Trainer.destroy_all
TrainerPokemon.destroy_all

require 'net/http'
require 'json'

url_type = 'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/types.json'
uri_type = URI(url_type)
response = Net::HTTP.get(uri_type)
types = JSON.parse(response)
types.each do |type|
  pokemon_type = type['english']
  Type.create(pokemonType: pokemon_type)
  puts " Inserted #{pokemon_type} into Types"
end

50.times do
  trainer = Trainer.create(
    name: Faker::Name.unique.name,
    age: Faker::Number.within(range: 8..42)
  )
  puts "Inserted #{trainer.name} into Trainer table"
end

url_move = 'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/moves.json'
uri_move = URI(url_move)
response = Net::HTTP.get(uri_move)
moves = JSON.parse(response)

moves.each do |move|
  name = move['ename']
  accuracy = move['accuracy']
  power = move['power']
  pp = move['pp']
  type = move['type']
  type_actual = Type.where(pokemonType: type).first
  type_actual.move.build(accuracy: accuracy, move: name, power: power, pp: pp).save
end

url_pokemon = 'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/pokedex.json'
uri_pokemon = URI(url_pokemon)
response = Net::HTTP.get(uri_pokemon)
pokemons = JSON.parse(response)

pokemons.each do |poke|
  name = poke['name']['english']
  hp = poke['base']['HP']
  attack = poke['base']['Attack']
  defense = poke['base']['Defense']
  spAttack = poke['base']['Sp. Attack']
  spDefense = poke['base']['Sp. Defense']
  speed = poke['base']['Speed']

  current_types = poke['type']

  current_pokemon = Pokemon.create(name: name, hp: hp, attack: attack,
                                   defence: defense, spAttack: spAttack,
                                   spDefense: spDefense, speed: speed)
  current_pokemon.save

  current_types.each do |itype|
    type_actual = Type.where(pokemonType: itype).first
    type_actual.move(4).each do |move|
      PokemonMove.create(pokemon: current_pokemon, move: move)
    end
    PokemonType.create(pokemon: current_pokemon, type: type_actual)
  end
end
