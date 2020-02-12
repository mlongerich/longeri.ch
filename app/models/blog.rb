# frozen_string_literal: true

# Model for Blogs
class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }

  extend FriendlyId
  friendly_id :title, use: :slugged
end
