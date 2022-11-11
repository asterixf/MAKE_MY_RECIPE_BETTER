class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.text :ingredients
      t.text :directions
      t.boolean :variation_status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
