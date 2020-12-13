class Users::SessionsController < Devise::SessionsController
  # ゲストログイン機能
  def new_guest
    user = User.guest
    sign_in user
    redirect_to stresses_path
  end

end
