# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Creating admin user"
admin = Admin.where(email: Rails.application.credentials.dig(:admin, :email)).first_or_initialize
admin.update!(
  password: Rails.application.credentials.dig(:admin, :password),
  password_confirmation: Rails.application.credentials.dig(:admin, :password),
  name: "Jean Emmanuel Cadet",
  bio: "I specialize in designing, building, and deploying innovative software solutions for businesses as a Full-stack software engineer."
)
puts "Done creating admin user"

# puts "Creating new articles"
# ActiveRecord::Base.transaction do
#   30.times do |i|
#     puts "Creating article #{i + 1}"
#     Article.create!(
#       title: Faker::Company.name,
#       author: admin,
#       content: Faker::Lorem.sentence,
#     )
#   rescue => e
#     puts "Error on article #{i + 1}: #{e.message}"
#     raise
#   end
# end
# puts "Done creating new articles"
