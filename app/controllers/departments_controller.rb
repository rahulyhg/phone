class DepartmentsController < ApplicationController
	def index
		@departments = Department.all
	end

	def new
		@department = Department.new
	end

	def department_params
		params.require(:department).permit(:name)
	end


	def create
		@department = Department.new(department_params)
		if @department.save
			redirect_to departments_path
		else
			render "new"
		end
	end

	def edit
		@department = Department.find(params[:id])
	end

	def show
		@department_employees = []
	 	@department = Department.find(params[:id])
	 	@employees = Employee.all
	 	@employees.each do |employee|
	 		employee.memberships.each do |membership|
		 		if membership.department_id == @department.id
		 			@department_employees << employee
		 		end
		 	end
	 	end
	end

	def update
		@department = Department.find(params[:id])
		if @department.update_attributes(department_params)
			redirect_to departments_path
		else
			render "edit"
		end
	end

	def destroy
		@department = Department.find(params[:id])
		@department.destroy
		redirect_to departments_url
	end

end
