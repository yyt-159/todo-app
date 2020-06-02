class UsersController < ApplicationController

  skip_before_action :require_sign_in!, only: [:new, :create]#ログイン確認無視
  before_action :admin_user, only: [:destroy ,:index]
  before_action :set_user, only: [:destroy, :show, :edit, :update]#セット系

  def index#ユーザー一覧（管理者権限でしか見られない）
    @user = User.all
  end

  def show
  end

  def edit
    redirect_to("/users/index") unless current_user?(@user)
  end

  def new
    @user = User.new
  end

  def create #新規登録
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      flash[:success] = 'ログインしました'
      redirect_to tasks_path
    else
      flash.now[:danger] = '登録に失敗しました'
      render 'new'
    end
  end

  def update
      @user.name = params[:name]
      @user.mail = params[:mail]#これでも問題ない
    if current_user?(@user) && @user.save
      redirect_to "/users/#{@user.id}/show"    
    else
      flash.now[:danger] = '編集に失敗しました'
      render 'edit'
    end
  end

  def destroy#管理者しかできない
    @user.destroy
    flash[:success] = "削除しました"
    redirect_to users_index_path
  end

  private

    def user_params
      params.permit(:name, :mail, :password, :password_confirmation)
    end

    def set_user
      @user = User.find_by(id: params[:id])
    end

    def admin_user
      redirect_to(root_path) unless @current_user.admin?
    end

end
