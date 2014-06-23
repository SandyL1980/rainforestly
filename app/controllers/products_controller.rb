class ProductsController < ApplicationController
  # leaving this in preventing users from seeing products
  # before_filter :ensure_logged_in, :only => [:show]

  def index
    @products = Product.all
  end

  def show
    begin
      @product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to "/"
    rescue ActiveRecord::CatchAll
      #Only comes in here if nothing else catches the error
      redirect_to "/"
    end
    if current_user
      @review = @product.reviews.build
    end
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_url
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :price_in_cents)
    end
end
