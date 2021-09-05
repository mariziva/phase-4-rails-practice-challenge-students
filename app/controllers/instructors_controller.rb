class InstructorsController < ApplicationController

def index
    instructors = Instructor.all
    render json: instructors
end

def show
    instructor = Instructor.find(params[:id])
    if instructor
        render json: instructor, status: :ok
    else
        render json: {"error": "Instructor not found"}, status: :not_found
    end
end

def create
    instructor = Instructor.create(instructor_params)
        if instructor.valid?
            render json: instructor, status: :created
        else
            render json: {"errors": ["validation errors"]}, status: :unprocessable_entity
        end
 end

 def update
    instructor = Instructor.update(instructor_params)
        if instructor.valid?
            render json: instructor, status: :updated
        else
            render json: {"errors": ["validation errors"]}, status: :unprocessable_entity
        end
 end
 
 def destroy
    instructor = Instructor.find(id: params[:id])
    if instructor
        instructor.destroy
        head :no_content, status: :no_content
    else
        render json: { "error": "Instructor not found" }, status: :not_found
 end
end

private

def instructor_params 
    params.permit(:id, :name)
end


end
