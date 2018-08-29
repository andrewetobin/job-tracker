class JobsController < ApplicationController
  before_action :set_job, only: [:show, :update, :edit, :destroy]

  def index
   if params[:location]
     @jobs = Job.location_params(params)
     @header = "#{params[:location]} Jobs"
   elsif params[:category]
     @jobs = Job.category_params(params)
     @header = "#{params[:category]} Jobs"
   elsif params[:sort]
     params_sort(params)
   else
     @jobs = Job.all
     @header = "All Jobs"
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
    @comment = @job.comments.new
    @comments = @job.comments.all
  end

  def edit
  end

  def update
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
    @job.comments.destroy_all
    @job.destroy
    redirect_to jobs_path
  end

  private

    def job_params
      params.require(:job).permit(:title, :description, :level_of_interest, :city, :company_id, :category_id)
    end

    def params_sort(params)
      if params[:sort]=='interest'
        @jobs = Job.sort_level_interest
        @header = 'Jobs sorted by Level of Interest'
      else params[:sort]=='location'
        @jobs = Job.city_sort
        @header = 'Jobs sorted by City'
      end
    end

    def set_job
      @job = Job.find(params[:id])
    end
end
