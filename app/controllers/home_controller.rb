class HomeController < ApplicationController
  def index
    @employees = Employee.all
    if employee_signed_in?
      @one_employee = Employee.find(current_employee.id)
    end
    end
  end