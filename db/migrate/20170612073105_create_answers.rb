class CreateAnswers < ActiveRecord::Migration
  def change
    change_table :answers do |t|
      t.text :detail

      t.timestamps
    end
  end
end
