class AddDayMonthAndYearToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :day, :string
    add_column :posts, :month, :string
    add_column :posts, :year, :string
  end
end
