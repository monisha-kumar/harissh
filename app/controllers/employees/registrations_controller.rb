# frozen_string_literal: true

class Employees::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
    @qualification = Qualification.new(qualification_params)
    @qualification.employee_id = resource.id
    @qualification.save

    @salary =Salary.new(salary_params)
    @salary.employee_id = resource.id
    @salary.save

    @leave = Leave.new(leave_params)
    @leave.employee_id = resource.id
    @leave.save

    @detail= Detail.new(detail_params)
    @detail.employee_id = resource.id
    @detail.save
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  def after_sign_up_path_for(resource)
    flash[:notice] = "Employee added successfully."
    sign_out resource
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  def qualification_params
    params.require(:employee).permit(:stream,:yop,:aggregate, :employee_id)
  end

  def leave_params
    params.require(:employee).permit(:date_from,:date_to, :reason,:employee_id)
  end

  def salary_params
    params.require(:employee).permit( :basic_pay, :hra, :allowance, :deduction,:total_salary, :employee_id)
  end

  def detail_params
    params.require(:employee).permit(:name,:dob, :f_name, :m_name, :address,:experience,:ph_no,:email,:employee_id)
  end
end
