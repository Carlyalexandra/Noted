class AddThumbnailToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :thumbnail, :string
  end
end
