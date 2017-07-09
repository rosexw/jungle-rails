class ProductsController < AdminController

  before_filter :authorize

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @review = Review.new
  end

end
