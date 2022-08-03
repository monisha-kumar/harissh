class DetailsController < ApplicationController
  def index
    @employees = Employee.all
    if employee_signed_in?
      @one_employee = Employee.find(current_employee.id)
    end
  end

    def show
      if admin_signed_in?
        @employee = Employee.find(params[:id])

      else
        redirect_to admin_session_path
  end
    end

  def edit
    if admin_signed_in? or employee_signed_in?
      @employee = Employee.find(params[:id])
      @detail = @employee.detail
      # debugger
    else
      redirect_to admin_session_path
    end
  end

  def update
    @employee =Employee.find(params[:id])
    @detail= @employee.detail
    if @detail.update(emp_params)
    flash[:notice] = "Employee details was updated successfully"
    redirect_to root_path
  else
    render :edit, status: :unprocessable_entity
  end
  end


  def destroy

    @employee= Employee.find(params[:id])
    @employee.destroy
    redirect_to root_path
  end

  private
  def emp_params
    params.require(:employee).permit(:name, :dob, :ph_no, :experience,:f_name, :email,:employee_id,:m_name, :address)
  end


end




