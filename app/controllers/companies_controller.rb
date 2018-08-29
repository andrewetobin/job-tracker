class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :update, :edit, :destroy, :jobs_index]
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "#{@company.name} added!"
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def show
    @contact = @company.contacts.new
    @contacts = @company.contacts.all
  end

  def edit
  end

  def update
    @company.update(company_params)
    if @company.save
      flash[:success] = "#{@company.name} updated!"
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  def destroy
    @company.destroy

    flash[:success] = "#{@company.name} was successfully deleted!"
    redirect_to companies_path
  end

  def jobs_index
    @jobs = @company.jobs
  end


  private

    def company_params
      params.require(:company).permit(:name, :city)
    end

    def set_company
      @company = Company.find(params[:id])
    end
end
