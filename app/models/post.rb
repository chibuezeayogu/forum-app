# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  has_many :comments, dependent: :destroy

  validates :title, presence: true
end
