class MonthlyRecordsController < ApplicationController
  before_action :current_user_must_be_monthly_record_user,
                only: %i[edit update destroy]

  before_action :set_monthly_record, only: %i[show edit update destroy]

  def index
    @q = MonthlyRecord.ransack(params[:q])
    @monthly_records = @q.result(distinct: true).includes(:user).page(params[:page]).per(10)
  end

  def show; end

  def new
    @monthly_record = MonthlyRecord.new
  end

  def edit; end

  def create
    @monthly_record = MonthlyRecord.new(monthly_record_params)

    if @monthly_record.save
      message = "MonthlyRecord was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @monthly_record, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @monthly_record.update(monthly_record_params)
      redirect_to @monthly_record,
                  notice: "Monthly record was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @monthly_record.destroy
    message = "MonthlyRecord was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to monthly_records_url, notice: message
    end
  end

  private

  def current_user_must_be_monthly_record_user
    set_monthly_record
    unless current_user == @monthly_record.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_monthly_record
    @monthly_record = MonthlyRecord.find(params[:id])
  end

  def monthly_record_params
    params.require(:monthly_record).permit(:user_id, :date, :month,
                                           :monthly_net_carbon, :offset_solution, :offset_carbon_amount)
  end
end
