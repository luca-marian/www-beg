# schedule initial job, it will reschedule itself
Rails.application.config.after_initialize do
  PlantStatusSyncJob.perform_later
end