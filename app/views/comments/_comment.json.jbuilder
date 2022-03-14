json.extract! comment, :id, :log_id, :commenter_id, :comment, :date, :time, :created_at, :updated_at
json.url comment_url(comment, format: :json)
