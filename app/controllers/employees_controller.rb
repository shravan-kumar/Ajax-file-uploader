class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
    unless params[:name].to_s.empty?
      @employees = @employees.where("name like ?", "%#{params[:name]}%")
    end
    unless params[:date].to_s.empty?
      @employees = @employees.where("date like ?", "%#{params[:date]}%")
    end
    unless params[:number].to_s.empty?
      @employees = @employees.where(number: params[:number])
    end
    respond_to do |format|
      format.json { render json: @employees}
    end
  end

  def import
    Employee.import(params[:file])
    respond_to do |format|
      format.html { redirect_to root_url, notice: "Employees imported." }
      format.json { render json: Employee.all}
    end

  end


end