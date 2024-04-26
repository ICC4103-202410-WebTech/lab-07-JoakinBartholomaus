# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Post.delete_all
User.delete_all

require 'faker'

5.times do
  user = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )

  post = Post.create(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph,
    published_at: Faker::Time.backward(days: 30),
    user: user,
    answers_count: rand(1..20),
    likes_count: rand(1..100)
  )

  tag = Tag.count < 5 ? Tag.create(name: Faker::Lorem.word) : Tag.all.sample
  post.tags << tag
end

5.times do
  post = Post.create(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph,
    published_at: Faker::Time.backward(days: 30),
    user: User.all.sample,
    answers_count: rand(1..20),
    likes_count: rand(1..100)
  )

  tag = Tag.all.sample
  post.tags << tag
end
