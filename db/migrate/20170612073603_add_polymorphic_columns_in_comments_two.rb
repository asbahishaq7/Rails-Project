class AddPolymorphicColumnsInCommentsTwo < ActiveRecord::Migration
  def change
  #  remove_column :comments, :question_id, :references
  #  remove_column :comments, :answer_id, :references

    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
    add_index :comments, [:commentable_type, :commentable_id]

  #  change_table :comments do |t|
  #    t.belongs_to :commentable, polymorphic: true, index: true
  #  end
  end
  def up
    remove_column :comments, :question_id, :references
  end
end
