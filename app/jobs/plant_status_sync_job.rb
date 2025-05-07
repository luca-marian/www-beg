class PlantStatusSyncJob < ApplicationJob
  queue_as :default

  def perform(*args)
    status = PowerStatusClient.new.get_statuses

    status.each do |row|
      PowerGeneration.where(plant_name: row[:plant_name], timestamp: row[:timestamp]).first_or_create!(
        operational: row[:operational],
        capacity: row[:capacity],
        production: row[:production]
      )
    end
    PlantStatusSyncJob.set(wait: 5.minutes).perform_later
  end
end
