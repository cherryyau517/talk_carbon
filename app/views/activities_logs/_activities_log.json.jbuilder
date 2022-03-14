json.extract! activities_log, :id, :activity_id, :date, :time, :activity_remarks, :addition, :carbon_amount, :user_id, :created_at, :updated_at
json.url activities_log_url(activities_log, format: :json)
