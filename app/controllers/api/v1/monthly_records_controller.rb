class Api::V1::MonthlyRecordsController < Api::V1::GraphitiController
  def index
    monthly_records = MonthlyRecordResource.all(params)
    respond_with(monthly_records)
  end

  def show
    monthly_record = MonthlyRecordResource.find(params)
    respond_with(monthly_record)
  end

  def create
    monthly_record = MonthlyRecordResource.build(params)

    if monthly_record.save
      render jsonapi: monthly_record, status: :created
    else
      render jsonapi_errors: monthly_record
    end
  end

  def update
    monthly_record = MonthlyRecordResource.find(params)

    if monthly_record.update_attributes
      render jsonapi: monthly_record
    else
      render jsonapi_errors: monthly_record
    end
  end

  def destroy
    monthly_record = MonthlyRecordResource.find(params)

    if monthly_record.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: monthly_record
    end
  end
end
