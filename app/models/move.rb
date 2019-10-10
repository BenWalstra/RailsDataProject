# frozen_string_literal: true

class Move < ApplicationRecord
  validates :move, :moveCounter, :accuracy, :power, :pp, presence: true
  validates :move, uniqueness: true
  belongs_to :type
  has_many :pokemon, through: :pokemon_move
end
