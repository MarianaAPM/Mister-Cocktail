class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :content, default: ""
      t.decimal :rating, default: 0, precision: 2, scale: 1
      t.integer :likes
      t.string :user
      t.references :cocktail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
