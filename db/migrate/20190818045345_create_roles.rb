class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.integer :type_of
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
