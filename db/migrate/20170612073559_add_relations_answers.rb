class AddRelationsAnswers < ActiveRecord::Migration
  def change
    change_table :answers do |t|
    	t.belongs_to :user, index: true
    	t.belongs_to :question, index: true
    end
  end
end
