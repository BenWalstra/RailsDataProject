# frozen_string_literal: true

# Nuke db
Type.destroy_all
PokemonMove.destroy_all
TrainerPokemon.destroy_all
Trainer.destroy_all
Move.destroy_all
Pokemon.destroy_all

require 'net/http'
require 'json'

url = 'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/types.json'
uri = URI(url)
response = Net::HTTP.get(uri)
data = JSON.parse(response)
data.each do |data|
  title = data['english']
  Type.create(pokemonType: title)
  puts title
end
