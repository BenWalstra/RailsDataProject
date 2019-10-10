class Type < ApplicationRecord
  has_many :pokemon
  has_many :move
end
