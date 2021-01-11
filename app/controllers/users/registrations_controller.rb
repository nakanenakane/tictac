# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    if @user.save
      session[:user_id] = @user.id
      session["devise.regist_data"] = {user: @user.attributes}
    redirect_to menu_path
    else
      render "new"
    end
  end

end
