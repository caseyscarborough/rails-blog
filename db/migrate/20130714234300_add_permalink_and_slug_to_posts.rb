class AddPermalinkAndSlugToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :permalink, :string
    add_column :posts, :slug, :string
  end
end
