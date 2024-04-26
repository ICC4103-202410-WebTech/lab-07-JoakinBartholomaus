class Post < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :tags
    belongs_to :parent_post, class_name: 'Post', optional: true
    has_many :child_posts, class_name: 'Post', foreign_key: 'parent_post_id'
    validates :title, presence: {message: "The post must have a title"}
    validates :content, presence: {message: "You can't publish an empty post. Write something interesting"}
    validates :user_id, presence: {message: "A user is required to create a post"}
    validates :answers_count, numericality: { greater_than_or_equal_to: 0, message: "The answers count must be greater than or equal to zero." }
    validates :likes_count, numericality: { greater_than_or_equal_to: 0, message: "The likes count must be greater than or equal to zero." }

    before_validation :set_default_published_at

    private
  
    def set_default_published_at
      self.published_at ||= Time.current
    end 
end