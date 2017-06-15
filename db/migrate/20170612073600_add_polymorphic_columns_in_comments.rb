class AddPolymorphicColumnsInComments < ActiveRecord::Migration
  def change
  	remove_reference :questions, index: true
  	remove_reference :answers, index: true
    #add_column :comments, :commentable_id, :integer
    #add_column :comments, :commentable_type, :string
    #add_index :comments, [:commentable_type, :commentable_id]

    #change_table :comments do |t|
    #  t.belongs_to :commentable, polymorphic: true, index: true
    #end
  end
end
