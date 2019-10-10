# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_10_071853) do

  create_table "moves", force: :cascade do |t|
    t.string "move"
    t.integer "moveCounter"
    t.integer "accuracy"
    t.integer "power"
    t.integer "pp"
    t.integer "type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["type_id"], name: "index_moves_on_type_id"
  end

  create_table "pokemon_moves", force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.integer "move_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["move_id"], name: "index_pokemon_moves_on_move_id"
    t.index ["pokemon_id"], name: "index_pokemon_moves_on_pokemon_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.integer "hp"
    t.integer "attack"
    t.integer "defence"
    t.integer "speed"
    t.integer "spAttack"
    t.integer "spDefense"
    t.string "imageUrl"
    t.integer "type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["type_id"], name: "index_pokemons_on_type_id"
  end

  create_table "trainer_pokemons", force: :cascade do |t|
    t.integer "trainer_id", null: false
    t.integer "pokemon_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id"], name: "index_trainer_pokemons_on_pokemon_id"
    t.index ["trainer_id"], name: "index_trainer_pokemons_on_trainer_id"
  end

  create_table "trainers", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "pokemonType"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "moves", "types"
  add_foreign_key "pokemon_moves", "moves"
  add_foreign_key "pokemon_moves", "pokemons"
  add_foreign_key "pokemons", "types"
  add_foreign_key "trainer_pokemons", "pokemons"
  add_foreign_key "trainer_pokemons", "trainers"
end
