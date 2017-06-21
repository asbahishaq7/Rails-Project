class AddRelationsComments < ActiveRecord::Migration
  def change
    change_table :comments do |t|
    	t.belongs_to :user, index: true
    	t.belongs_to :question, index: true
    	t.belongs_to :answer, index: true
    end
  end
end
