class StatusController < ApplicationController

  def  edit
  if employee_signed_in?

    @employee = Employee.find(current_employee.id)
    # debugger
    present_status = @employee.leave.status
    if present_status == "Pending" or present_status == "Approved" or present_status == "Denied"
      @leave = @employee.leave
      # debugger
    end

  else
    redirect_to new_employee_session_path
  end
end

def update

  @employee = Employee.find(current_employee.id)
  @leave = @employee.leave
  @leave.update(status: "", type_of_leave: "", days: "", from_date: "", to_date: "")
  redirect_to status_edit_path

end
  end
