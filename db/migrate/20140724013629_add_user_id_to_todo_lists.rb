class AddUserIdToTodoLists < ActiveRecord::Migration
  def change
  	add_column :todo_lists, :user_id, :interger
  	add_index :todo_lists, :user_id
  end
end
