class SalariesController < ApplicationController

    def edit
      if admin_signed_in? or employee_signed_in?
        @salary= Salary.find(params[:id])
        @salary.save
      else
        redirect_to admin_session_path
      end
    end


    def update
      @salary= Salary.find(params[:id])
      if  @salary.update(salary_params)
        flash[:notice] = "salary is updated successfully"
        if admin_signed_in?
          redirect_to detail_path( @salary.employee.id)
        else
          redirect_to root_path
        end
      else
        render edit_salary_path
      end
    end

    private

    def salary_params
      params.require(:salary).permit( :basic_pay, :hra,:allowance,:deduction,:total_salary,:employee_idO)
    end

end
