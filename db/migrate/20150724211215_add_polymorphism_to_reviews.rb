class AddPolymorphismToReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :project_id, :integer
    remove_column :reviews, :profile_id, :integer
    add_column :reviews, :reviewable_id, :integer
    add_column :reviews, :reviewable_type, :string
  end
end
