class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :edit, :update, :destroy]
  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to  category_path(@category), notice: 'Categorie créée!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: "Catégorie a été mis à jour."
    else
      render :edit, alert: "Impossible de mettre à jour la catégorie."
    end
  end

  def destroy
    # On récupère l'id avec before_action
    # On supprime l'enregistrement avec l'id dans la BdD
    @category.destroy
    # On redirige vers la page index
    redirect_to categories_path, status: :see_other, :notice => "Catégorie supprimée!"
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:nom, :image, :background_color)
  end
end
