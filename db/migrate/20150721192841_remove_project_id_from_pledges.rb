class RemoveProjectIdFromPledges < ActiveRecord::Migration
  def change
    remove_column :pledges, :project_id, :integer
  end

  def change
    add_column :rewards, :pledge_id, :integer
  end
end
