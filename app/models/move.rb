# frozen_string_literal: true

class Move < ApplicationRecord
  validates :move, :accuracy, :power, :pp, presence: true
  validates :move, uniqueness: true
  belongs_to :type
  has_many :pokemon_moves
  has_many :pokemon, through: :pokemon_moves
end
