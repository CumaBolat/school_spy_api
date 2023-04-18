class Parent < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  before_save { self.email = email.downcase }

  validates :name, presence: true,
              uniqueness: {case_sensitive: false},
              length: {minimum: 3, maximum: 25}

  validates :surname, presence: true,
              length: {minimum: 3, maximum: 25}

  validates :email, presence: true, length: {maximum: 30},
              uniqueness: {case_sensitive: false},
              format: {with: VALID_EMAIL_REGEX}

  has_secure_password
  
  belongs_to :teacher
end