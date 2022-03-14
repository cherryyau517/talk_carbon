json.extract! monthly_record, :id, :user_id, :date, :monthly_net_carbon,
              :offset_solution, :offset_carbon_amount, :month, :created_at, :updated_at
json.url monthly_record_url(monthly_record, format: :json)
