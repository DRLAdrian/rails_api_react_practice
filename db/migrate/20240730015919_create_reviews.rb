class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :description
      t.integer :score
      t.references :airline, null: false, foreign_key: true

      t.timestamps
    end
  end
end
