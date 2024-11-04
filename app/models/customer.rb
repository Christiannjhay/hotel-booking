class Customer < ApplicationRecord
  enum role: { user: 0, admin: 1 }
  has_many :reviews
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :mobile, presence: true
  validates :password_1, presence: true, length: { minimum: 6 }
  
  validate :passwords_match

  private

  def passwords_match
    if password_1 != password_2
      errors.add(:password, "Password confirmation does not match Password")
    end
  end
end
