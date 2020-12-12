class InquiryController < ApplicationController

  def index
    # メールの入力画面
    @inquiry = Inquiry.new
    render :action => 'index'
  end

  def confirm
    # 入力値のチェック
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.valid?
      # 確認画面を表示
      render :action => 'confirm'
    else
      # 入力画面を再表示
      render :action => 'index'
    end
  end

  def thanks
      # メール送信
    @inquiry = Inquiry.new(inquiry_params)
    InquiryMailer.received_email(@inquiry).deliver

    render :action => 'thanks'
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end

end
