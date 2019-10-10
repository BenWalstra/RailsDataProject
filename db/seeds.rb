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
  # house = House.create(
  #   name: Faker::Movies::HarryPotter.unique.house,
  #   points: Faker::Number.within(range: 10..237)
  # )

  # number_of_students = rand(10..15)
  # number_of_teachers = rand(3..6)

  # number_of_students.times do
  #   house.students.build(name: Faker::Movies::HarryPotter.unique.character)
  #        .save
  # end

  # number_of_teachers.times do
  #   house.teachers.build(name: Faker::Movies::HarryPotter.unique.character)
  #        .save
  # end
end