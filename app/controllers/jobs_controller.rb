class JobsController < ApplicationController
  def index
    if params[:sort] == 'location'
      @jobs = Job.order(:city)
    elsif params[:location]
      @jobs = Job.where(city: params[:location])
    else
      @jobs = Job.all
    end
  end

  def new
    @job = Job.new()
  end

  def create
    @job = Job.new(job_params)
    @company = @job.company
    if @job.save
      flash[:success] = "You created #{@job.title} for #{@company.name}"
      redirect_to job_path(@job)
    else
      flash[:success] = "Job creation unsuccessful"
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @comment = @job.comments.new
    @comments = @job.comments.all
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @company = @job.company
    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} for #{@company.name} updated!"
      redirect_to job_path(@job)
    else
      render :edit
    end
  end

  def destroy
    job = Job.find(params[:id])
    job.comments.destroy_all
    job.destroy
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :company_id, :category_id)
  end
end
