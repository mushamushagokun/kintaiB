class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)     # ログイン時、sessionのremember_me属性が1(チェックボックスがオン)ならセッションを永続的に、それ以外なら永続的セッションを破棄する
      redirect_back_or user
    else
      flash.now[:danger] = 'メールアドレスとパスワードの情報が一致しませんでした。'
      render 'new'
    end
  end
  

   def destroy
    log_out if logged_in?
    redirect_to root_url
   end
   
   module SessionsHelper

    # 渡されたユーザーでログインする
    def log_in(user)                                                              # login_inメソッドにuser(ログイン時にユーザーが送ったメールとパスと同一の、DBにいるユーザー)を引数として渡す
      session[:user_id] = user.id                                                 # ユーザーidをsessionのuser_idに代入（ログインidの保持）
    end
    
   end  
end