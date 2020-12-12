class StressesController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  before_action :authenticate_user!

  def index
    #フォローしたユーザーの投稿のみ表示
    user_ids = current_user.followings.pluck(:id) # フォローしているユーザーのid一覧
    user_ids.push(current_user.id) # 自身のidを一覧に追加する
    stress = Stress.where(user_id: user_ids).order(created_at: :desc)
    @user = current_user
    @stresses = stress.page(params[:page])
  end

  def show
    @stress = Stress.find(params[:id])
    @post_comment = PostComment.new
    @user = current_user
  end

  def new
    @stress = Stress.new
  end

  def create
    @stress = Stress.new(stress_params)
    @stress.user_id = current_user.id
    if @stress.save
      redirect_to stress_path(@stress)
      flash[:success] = 'ストレスを吐き出しました！'
    else
      render :new
    end
  end

  def edit
    @stress = Stress.find(params[:id])
  end

  def update
    @stress = Stress.find(params[:id])
    @stress.user_id = current_user.id
    if @stress.update(stress_params)
      redirect_to stress_path(@stress)
      flash[:change] = 'ストレスを編集しました！'
    else
      render :edit
    end
  end

  def destroy
    @stress = Stress.find(params[:id])
    @stress.destroy
    redirect_to stresses_path
    flash[:delete] = '過去のストレスを削除しました！'
  end

  private
  def stress_params
    params.require(:stress).permit(:user, :title, :body, :image)
  end

  def correct_user
    stress = Stress.find(params[:id])
    if current_user != stress.user.id
      redirect_to stresses_path
    end
  end
end
