class ProductsController < ApplicationController
     before_action :set_product, only: [:show, :edit, :update, :destroy]
     PER = 15
  def index
    @products = Product.page(params[:page]).per(PER)
  end

  def show
    # レビューを表示する。
    @reviews = @product.reviews
    @review = @reviews.new
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
   
 end

 def update
    @product.update(product_params)
   redirect_to product_url @product
 end

 def destroy
   byebug
    @product.destroy
    redirect_to products_url
 end
  
  private
   
 def set_product
   @product = Product.find(params[:id])
 end
  
  def product_params
   
  params.require(:product).permit(:name, :description, :price, :category_id)
  end
  
end
