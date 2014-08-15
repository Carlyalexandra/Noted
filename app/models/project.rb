class Project < ActiveRecord::Base
  belongs_to :user
  has_many :notes

  
  after_create :make_note

  def make_note
  	self.notes.create(title: "???", body: "Write something special...")
  end
end
