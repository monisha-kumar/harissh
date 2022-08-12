class ApplyController < ApplicationController
  def apply_leave
    if employee_signed_in?
    else
      redirect_to new_employee_session_path
    end
  end

  def update
    @employee =Employee.find(current_employee.id)
    @leave= @employee.leave
    current_name = params[:type_of_leave]
    if (Leave.column_names.include? current_name) and (@leave.instance_eval(current_name).to_i >= params[:days].to_i)
      @leave.update(status: "Pending")
      @leave.update(params.permit(:type_of_leave, :from_date, :to_date, :days))
      flash[:notice] = "Leave applied Successfully!"
      redirect_to   status_edit_path

  end
  end
  end
