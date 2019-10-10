# frozen_string_literal: true

class RemovePokemonTypeRefrence < ActiveRecord::Migration[6.0]
  def change
    remove_reference :pokemons, :type, index: true
  end
end
