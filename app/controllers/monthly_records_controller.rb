class MonthlyRecordsController < ApplicationController
  before_action :set_monthly_record, only: [:show, :edit, :update, :destroy]

  # GET /monthly_records
  def index
    @monthly_records = MonthlyRecord.all
  end

  # GET /monthly_records/1
  def show
  end

  # GET /monthly_records/new
  def new
    @monthly_record = MonthlyRecord.new
  end

  # GET /monthly_records/1/edit
  def edit
  end

  # POST /monthly_records
  def create
    @monthly_record = MonthlyRecord.new(monthly_record_params)

    if @monthly_record.save
      redirect_to @monthly_record, notice: 'Monthly record was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /monthly_records/1
  def update
    if @monthly_record.update(monthly_record_params)
      redirect_to @monthly_record, notice: 'Monthly record was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /monthly_records/1
  def destroy
    @monthly_record.destroy
    redirect_to monthly_records_url, notice: 'Monthly record was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monthly_record
      @monthly_record = MonthlyRecord.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def monthly_record_params
      params.require(:monthly_record).permit(:user_id, :date, :month, :monthly_net_carbon, :offset_solution, :offset_carbon_amount)
    end
end
