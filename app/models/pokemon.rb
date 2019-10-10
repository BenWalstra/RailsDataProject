# frozen_string_literal: true

class Pokemon < ApplicationRecord
  validates :name, :hp, :attack, :defence, :speed, :spAttack, :spDefense, presence: true
  validates :name, uniqueness: true
  belongs_to :type
  has_many :move, through: :pokemon_move
  has_many :trainer, through: :trainer_pokemon
end
