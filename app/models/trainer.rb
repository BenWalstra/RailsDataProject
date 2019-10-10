# frozen_string_literal: true

class Trainer < ApplicationRecord
  validates :name, :age, presence: true
  has_many :pokemon, through: :trainer_pokemon
end
