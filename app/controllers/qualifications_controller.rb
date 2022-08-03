class QualificationsController < ApplicationController

  def edit
    if admin_signed_in? or employee_signed_in?
      @qualification = Qualification.find(params[:id])
      @qualification.save
    else
      redirect_to admin_session_path
    end
  end

  def update
    @qualification = Qualification.find(params[:id])
    if @qualification.update(qualification_params)
      flash[:notice] = "Qualification details was updated successfully"
      if admin_signed_in?
        redirect_to detail_path(@qualification.employee.id)
      else
        redirect_to root_path
      end
    else
      render edit_qualification_path
    end
  end
  private
  def qualification_params
    params.require(:qualification).permit(:stream, :yop, :project, :aggregate ,:employee_id)
  end
end
