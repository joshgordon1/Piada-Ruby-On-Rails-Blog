class BlogPost < ApplicationRecord
    scope :recently_active, -> { order(Arel.sql("MAX(created_at, updated_at) DESC")) }
    belongs_to :user

    validates :title, presence: true
    validates :body, presence: true
end
