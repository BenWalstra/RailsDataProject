# frozen_string_literal: true

class Type < ApplicationRecord
  validates :type, presence: true, uniqueness: true
  has_many :pokemon
  has_many :move
end
