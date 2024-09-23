namespace :slide_mappings do
  desc "Delete all slide_mappings whose expiry_dates have passed"
  task delete_expired: :environment do
    SlideMapping.where.not("expiry_date is NULL OR expiry_date >= ? OR expiry_date = ?", Time.now, "").each do |slide_mapping|
      slide_mapping.destroy
    end
  end
end