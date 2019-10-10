class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.Integer :hp
      t.integer :attack
      t.integer :defence
      t.integer :speed
      t.integer :spAttack
      t.integer :spDefense
      t.string :imageUrl
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
