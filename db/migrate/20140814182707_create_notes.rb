class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :project, index: true
      t.string :title
      t.string :video_url
      t.text :body

      t.timestamps
    end
  end
end
