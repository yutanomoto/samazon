class ProductsController < ApplicationController
     before_action :set_product, only: [:show, :edit, :update, :destroy, :favorite]
  def index
    @products = Product.all
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
    @product.destroy
    redirect_to products_url
 end
 
 def favorite
    current_user.toggle_like!(product)
    redirect_to product_url product
 end

  
  private
   
 def set_product
   @product = Product.find(params[:id])
 end
  
  def product_params
   
  params.require(:product).permit(:name, :description, :price, :category_id)
  end
  
end
