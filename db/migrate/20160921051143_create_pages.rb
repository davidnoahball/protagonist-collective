class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.integer :child1_id
      t.integer :child2_id
      t.integer :parent_id
      t.boolean :end
      t.string :body
      t.string :end
      t.string :choice1
      t.string :choice2
      t.integer :adventure_id
      t.integer :user_id

      t.timestamps
    end
  end
end
