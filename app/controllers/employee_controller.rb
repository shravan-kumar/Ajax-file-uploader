class EmployeeController < ApplicationController
  def index
    @employees = Employee.all
  end

  def import
  	Employee.import(params[:file])
    redirect_to root_url, notice: "Employees imported."
  end
end
