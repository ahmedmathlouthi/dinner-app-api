class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string      :title,                 null: false, default: '', limit: 256
      t.string      :category,              null: false, default: '', limit: 256
      t.string      :cuisine,               null: false, default: '', limit: 256
      t.string      :author,                null: false, default: '', limit: 256
      t.string      :image,                 null: false, default: ''
      t.string      :ingredients,           array: true, default: []
      t.integer     :cook_time,             null: false, default: 0
      t.integer     :prep_time,             null: false, default: 0
      t.float       :ratings,               null: false, default: 0

      t.timestamps
    end

    add_index :recipes, :ingredients
  end
end
