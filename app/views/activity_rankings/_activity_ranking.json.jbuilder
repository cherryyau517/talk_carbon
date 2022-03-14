json.extract! activity_ranking, :id, :user_id, :activity_id, :date,
              :carbon_amount, :month, :created_at, :updated_at
json.url activity_ranking_url(activity_ranking, format: :json)
