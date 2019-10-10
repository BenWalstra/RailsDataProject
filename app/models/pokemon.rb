# frozen_string_literal: true

class Pokemon < ApplicationRecord
  belongs_to :type
  has_many :move, through: :pokemon_move
  has_many :trainer, through: :trainer_pokemon
end
