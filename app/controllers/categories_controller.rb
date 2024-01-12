class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @user = current_user
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to  categories_path(@category), notice: 'Categorie créée!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  private
  def category_params
    params.require(:category).permit(:nom, :image, :background_color)
  end
end
