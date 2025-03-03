class UsersController < ApplicationController
  before_action :set_user
  # ログインしていないユーザのアクセスを制限する。
  before_action :authenticate_user!

  def edit
   
  end

  def update
   
    @user.update_without_password(user_params)
    redirect_to mypage_users_url
  end

  def mypage
   
  end
  
  def edit_address
  
  end
  
 def update_password
   if password_set?
     @user.update_password(user_params) 
     flash[:notice] = "パスワードは正しく更新されました。"
     redirect_to root_url
   else
     @user.errors.add(:password, "パスワードに不備があります。")
     render "edit_password"
   end
 end
 
  def edit_password
  end
# お気に入りに追加した商品を表示させる。
  def favorite
   @favorites = @user.likees(Product)
  end
  
  private
  
     def set_user
       @user = current_user
     end
  def user_params
     params.permit(:name, :email, :address, :phone, :password, :password_confirmation)
  end
  
  def password_set?
      user_params[:password].present? && user_params[:password_confirmation].present? ?
      true : false
  end
end
