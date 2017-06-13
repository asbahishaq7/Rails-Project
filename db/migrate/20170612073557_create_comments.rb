class CreateComments < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.string :detail

      t.timestamps
    end
  end
end
