# frozen_string_literal: true

class Repository < ApplicationRecord
  belongs_to :owner

  scope :language, lambda { |language|
    where('language LIKE CONCAT("%", ?, "%")', language)
  }
end
