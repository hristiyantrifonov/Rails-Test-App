# In Rails 4 and earlier it is class Article < ActiveRecord::Base

class Article < ApplicationRecord

  # One to many association - the Many side
  belongs_to :user

  # Many to many association
  has_many :article_categories
  has_many :categories, through: :article_categories

  # To make sure that each article has a title before being save to db  --- Validation
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true
end