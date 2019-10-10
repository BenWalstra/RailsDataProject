# frozen_string_literal: true

class Type < ApplicationRecord
  validates :pokemonType, presence: true, uniqueness: true

  has_many :pokemon_types
  has_many :pokemon, through: :pokemon_types
  has_many :move
end
