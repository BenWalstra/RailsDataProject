# frozen_string_literal: true

class Trainer < ApplicationRecord
  has_many :pokemon, through: :trainer_pokemon
end
