class CreateMoves < ActiveRecord::Migration[6.0]
  def change
    create_table :moves do |t|
      t.string :move
      t.integer :moveCounter
      t.integer :accuracy
      t.integer :power
      t.integer :pp
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
