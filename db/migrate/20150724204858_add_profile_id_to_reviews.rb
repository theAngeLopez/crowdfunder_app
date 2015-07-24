class AddProfileIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :profile_id, :integer
  end
end
