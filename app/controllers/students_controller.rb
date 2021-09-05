class StudentsController < ApplicationController
    def index
        students = Student.all
        render json: students
    end
    
    def show
        student = Student.find(params[:id])
        if student
            render json: student, status: :ok
        else
            render json: {"error": "Student not found"}, status: :not_found
        end
    end
    
    def create
        student = Student.create(student_params)
            if student.valid?
                render json: student, status: :created
            else
                render json: {"errors": ["validation errors"]}, status: :unprocessable_entity
            end
     end
     
     def update
        student = student.update(student_params)
            if student.valid?
                render json: student, status: :updated
            else
                render json: {"errors": ["validation errors"]}, status: :unprocessable_entity
            end
     end
     
     def destroy
        student = student.find(id: params[:id])
        if student
            student.destroy
            head :no_content, status: :no_content
        else
            render json: { "error": "Student not found" }, status: :not_found
     end
    end
    
    private
    
    def student_params 
        params.permit(:name, :age, :major, :instructor_id)
    end
    

end
