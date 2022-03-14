json.extract! activity_log, :id, :activity_name, :activity_type_id, :date,
              :time, :activity_remarks, :addition, :carbon_amount, :user_id, :created_at, :updated_at
json.url activity_log_url(activity_log, format: :json)
