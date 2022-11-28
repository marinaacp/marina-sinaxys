class AddDetailsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :professional_experience, :text
  end
end
