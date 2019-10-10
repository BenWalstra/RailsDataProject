# frozen_string_literal: true

class Pokemon < ApplicationRecord
  validates :name, :hp, :attack, :defence, :speed, :spAttack, :spDefense, presence: true
  validates :name, uniqueness: true

  has_many :pokemon_types
  has_many :type, through: :pokemon_types
  has_many :move, through: :pokemon_move
  has_many :trainer, through: :trainer_pokemon
end
