class UserPolicy
  attr_writer :user, :record

  def initialize(user,record)
    @user = user
    @record = record
  end

  def index?
    @user.super_admin? || @user.board_member?
  end

end