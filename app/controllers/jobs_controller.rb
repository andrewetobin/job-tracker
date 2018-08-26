class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @comment = @job.comments.new
    @comments = @job.comments.all
  end

  def edit
    # implement on your own!
  end

  def update
    # implement on your own!
  end

  def destroy
    job = Job.find(params[:id])
    job.destroy
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :company_id, :category_id)
  end
end
