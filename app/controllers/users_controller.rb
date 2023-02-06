class UsersController < ApplicationController
  before_action :parent, except: [:index, :new]

  def index
    @users = User
    @users = @users.where(userid: params[:search][:userid]) if params[:search].present? && params[:search][:userid].present?
    @users = @users.page(params[:page]).per(params[:per])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @user = User.new
  end

  def show
  end

  def edit
  end

  def update
    @user.assign_attributes(user_params)
    begin
      ActiveRecord::Base.transaction() do
        if @user.save
          redirect_to users_path, flash: {success: t('message.success_completed')}
        else
          render 'edit'
        end
      end
    rescue => e
      logger.error(e.message)
      redirect_to users_path, flash: {alert: e.message}
    end
  end

  def create
    @user = User.new(user_params)
    begin
      ActiveRecord::Base.transaction() do
        if @user.save
          redirect_to users_path, flash: {success: t('message.success_completed')}
        else
          render 'new'
        end
      end
    rescue => e
      logger.error(e.message)
      redirect_to users_path, flash: {alert: e.message}
    end
  end

  def destroy
    begin
      ActiveRecord::Base.transaction() do
        @user.destroy!
        redirect_to users_path
      end
    rescue => e
      logger.error(e.message)
      redirect_to users_path, flash: {alert: e.message}
    end
  end

  private

  def parent
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :sei,
      :mei,
      :sei_kana,
      :mei_kana,
      :mobile,
    )
  end
end
