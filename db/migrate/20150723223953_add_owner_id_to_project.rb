class AddOwnerIdToProject < ActiveRecord::Migration
  def change
    add_reference :projects, :owner, index: true
  end
end
