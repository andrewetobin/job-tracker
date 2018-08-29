class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :edit, :destroy]

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
      flash[:notice] = "Sorry, that category name already exists!"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @category.update(category_params)
    if @category.save
      flash[:success] = "#{@category.title} updated!"
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    @category.destroy

    flash[:success] = "#{@category.title} was successfully deleted!"
    redirect_to categories_path
  end

  private

    def category_params
      params.require(:category).permit(:title)
    end

    def set_category
      @category = Category.find(params[:id])
    end
end
