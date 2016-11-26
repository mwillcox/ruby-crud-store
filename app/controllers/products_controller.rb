class ProductsController < ApplicationController
  def index
		@products = Product.all
	end

	def show
    @product = Product.find_by(id: params[:id])
	end

  def new
    @product = Product.new
  end

  def create
    title = params[:title]
    price = params[:price]
    image_url = params[:image]
    @product = Product.new(title: title, price: price, image: image_url)
    if @product.save
      flash[:success] = "Product Created!"
      redirect_to "/products/#{product.id}"
    else
      flash[:danger] = "Product Not Created!"
      render :new
    end
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.title = params[:title]
    @product.price = params[:price]
    if @product.save
      flash[:success] = "Product Updated!"
      redirect_to "/products/#{product.id}"
    else
      flash[:danger] = "Product NOT Updated!"
      render :edit
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    flash[:warning] = "Product Deleted!!!"
    redirect_to "/products"
  end

  def search
    @products = Product.where("title LIKE ?", "%#{params[:user_search]}%")
    render :index
  end
end
