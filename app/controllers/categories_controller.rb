class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "#{@category.title} added!"
      redirect_to categories_path(@category)
    else
      render :new
    end
  end
#
#   def show
#     company = Company.find(params[:id])
#     redirect_to company_jobs_path(company)
#   end
#
#   def edit
#     @company = Company.find(params[:id])
#   end
#
#   def update
#     @company = Company.find(params[:id])
#     @company.update(company_params)
#     if @company.save
#       flash[:success] = "#{@company.name} updated!"
#       redirect_to company_path(@company)
#     else
#       render :edit
#     end
#   end
#
#   def destroy
#     company = Company.find(params[:id])
#     company.destroy
#
#     flash[:success] = "#{company.name} was successfully deleted!"
#     redirect_to companies_path
#   end
#
#
  private
#
  def category_params
    params.require(:category).permit(:title)
  end

end
