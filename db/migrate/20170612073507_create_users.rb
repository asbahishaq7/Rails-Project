class CreateUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :name
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
