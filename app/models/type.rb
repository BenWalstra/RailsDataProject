# frozen_string_literal: true

class Type < ApplicationRecord
  validates :pokemonType, presence: true, uniqueness: true

  has_many :pokemon_types
  has_many :pokemon, through: :pokemon_types
  # has_many :pokemon_moves
  # has_many :move, through: :pokemon_moves
  has_many :moves
end
