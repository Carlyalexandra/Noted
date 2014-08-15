class AddUserRefToNote < ActiveRecord::Migration
  def change
    add_reference :notes, :user, index: true
    remove_reference :notes, :project, index: true
  end
end
