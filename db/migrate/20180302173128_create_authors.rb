class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.text :bio

      t.integer :user_id

      t.timestamps
    end

    add_index :authors, :user_id
  end
end
