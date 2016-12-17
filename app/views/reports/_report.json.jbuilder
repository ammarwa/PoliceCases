json.extract! report, :id, :caseId, :text, :video, :photo, :sound, :personId, :done, :date_time, :location, :created_at, :updated_at
json.url report_url(report, format: :json)