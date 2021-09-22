class Freelancer < ActiveRecord::Base
  before_create :confirmation_token
  has_secure_password
  # has_many :posts,dependent: :destroy
  # has_many :posts,dependent: :nullfy
  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end
  validates :name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :education, presence: true
  validates :experience, presence: true
  validates :industry, presence: true
  private
def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
end
