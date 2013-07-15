class AddApprovalToComments < ActiveRecord::Migration
  def change
    add_column :comments, :approved, :boolean
  end
end
