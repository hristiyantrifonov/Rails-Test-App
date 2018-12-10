class User <ApplicationRecord

  # One to many association - the one side
  has_many :articles
  before_save { self.email = email.downcase } # before it hits the database we can change it here

  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false},
            length: {minimum: 3, maximum: 25}

  VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: {maximum: 105},
            format: { with: VALID_EMAIL_REGEX }

  validates :user_id,
            presence: true

end