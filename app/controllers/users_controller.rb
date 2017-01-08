class UsersController < ApplicationController
  def index
    render locals: { users: users.ordered.decorate }
  end

  def show
    render locals: { user: user.decorate }
  end

  def new
    render locals: { user: User.new }
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to users_path, notice: t('notifications.created')
    else
      render :new, locals: { user: user }
    end
  end

  def edit
    render locals: { user: user }
  end

  def update
    if user.update(user_params)
      redirect_to users_path, notice: t('notifications.updated')
    else
      render :new, locals: { user: user }
    end
  end

  def destroy
    user.destroy!
    redirect_to users_path, notice: t('notifications.destroyed')
  end

  private

  def user
    return @_user if defined?(@_user)
    @_user = User.find(params[:id])
  end

  def users
    return @_users if defined?(@_users)
    @_users = User.all
  end

  def user_params
  end
end
