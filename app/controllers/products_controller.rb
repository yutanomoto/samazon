class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
   @product = Product.create(product_params)
 
  # データを保存する。
　　@product.save
　　# リダイレクト（別のページに移動すること）を行っています。createなどのアクションではビューを持たないので、この処理を書き忘れると
　　# 真っ白な画面のままになってしまいます。
   redirect_to product_url  @product
  end

  def edit
     @product = Product.find(params[:id])
      @categories = Category.all
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
   redirect_to product_url @product
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url
  end
  
   private
   def product_params
   
     params.require(:product).permit(:name, :description, :price, :category_id)
   end
end
