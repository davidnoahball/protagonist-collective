class AddWhichChildToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :which_child, :integer
  end
end
