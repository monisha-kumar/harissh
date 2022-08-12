class ApprovalController < ApplicationController
  def dashboard
    if admin_signed_in?
      @approval=Leave.where(status: "Pending")
    else
      redirect_to admin_session_path
    end
  end


  def update
    @leave=Leave.find_by(employee_id: params[:employee_id])

    if params[:approval_status] == "Approved"
      current_status=@leave.type_of_leave
      result=@leave.instance_eval(current_status).to_i - @leave.days.to_i
      @leave.update(current_status => result.to_s)
      @leave.update(status: "Approved")

    elsif params[:approval_status] == "Denied"


      @leave.update(status: "Denied")

    end
    redirect_to approval_dashboard_path

  end
end
