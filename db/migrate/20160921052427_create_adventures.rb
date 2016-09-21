class CreateAdventures < ActiveRecord::Migration[5.0]
  def change
    create_table :adventures do |t|
      t.string :title
      t.integer :critical_size

      t.timestamps
    end
  end
end