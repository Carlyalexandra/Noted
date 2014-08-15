class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :notes, :dependent => :destroy


  # def make_project
  #  	self.projects.create(title: "NEW PROJECT") 	
  #  end
end
