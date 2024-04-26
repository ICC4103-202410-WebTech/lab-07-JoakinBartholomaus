class Tag < ApplicationRecord
    has_and_belongs_to_many :posts
    validates :name, presence: { message: "Tag name can't be blank." }, uniqueness: { message: "Tag name must be unique." }
  end
  