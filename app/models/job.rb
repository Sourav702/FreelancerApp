class Job < ActiveRecord::Base
  belongs_to :user
	validates :title, presence: true, length: { minimum: 5 }
	validates :description,  presence: true
  validates :stipend,  presence: true
  before_save :capitalize_title
  private
  def capitalize_title
    self.title=self.title.upcase
  end
end