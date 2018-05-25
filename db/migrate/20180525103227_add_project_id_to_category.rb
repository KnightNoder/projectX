class AddProjectIdToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :project_id, :integer
    add_index :categories, :project_id
  end
end
