json.extract! monthly_record, :id, :user_id, :date, :month,
              :monthly_net_carbon, :offset_solution, :offset_carbon_amount, :created_at, :updated_at
json.url monthly_record_url(monthly_record, format: :json)
