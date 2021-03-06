class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.string :lookup_code
      t.string :original_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
