class CategoriesController < AdminController

  before_filter :authorize

  def index
    @categories = Category.order(created_at: :desc).all
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(article_params)

    if @category.save
      redirect_to [:admin, :categories], notice 'This category has been created!'
    else
      render 'new'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to [:admin, :categories], notice 'This cateogry has been deleted'
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

end
