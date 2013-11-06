class AddUserIdToDatafile < ActiveRecord::Migration
  def change
    add_column :datafiles, :user_id, :integer
  end
end
