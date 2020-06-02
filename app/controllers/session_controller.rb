class SessionController < ApplicationController
  skip_before_action :require_sign_in!, only: [:new, :create]#ユーザー登録スキップ
  before_action :set_user, only: [:create]#セット系

  def new
  end

  def create #ログイン
    if @user.authenticate(session_params[:password])
      sign_in(@user)
      flash[:success] = 'ログインしました'
      redirect_to tasks_path
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

    def set_user
      @user = User.find_by!(mail: session_params[:mail])
    rescue
      flash.now[:danger] = 'ログインに失敗しました'
      render action: 'new'
    end

    # 許可するパラメータ
    def session_params
      params.permit(:mail, :password)
    end

end
