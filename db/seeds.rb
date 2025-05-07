# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

if Occams::Cms::Site.count.zero?
  Occams::Cms::Site.create!(identifier: 'energy-company', hostname: ENV.fetch('SITE_HOSTNAME', 'localhost:3000'))
end

if Project.count < 20
  project_options = [
    'co-generation plant',
    'geo-thermal research plant',
    'wind farm',
    'solar installation',
    'concentrated solar plant',
    '5th gen BWR phase I',
    '5th gen BWR phase II',
    '5th gen BWR phase III',
    'thorium generating prototype',
    'regional distribution project',
    'substation expansion effort',
    'transfer line renewal initiative'
  ]
  20.times do
    end_at = (100+rand(1000)).days.ago
    begin_at = end_at - (300 + rand(1500)).days
    Project.create(
      title: "#{Faker::Address.city} #{project_options.sample}",
      cost: 5 + rand(30),
      description: Faker::Lorem.paragraph,
      begin_at: ,
      end_at:
    )
  end
end