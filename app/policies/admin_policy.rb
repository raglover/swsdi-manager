class AdminPolicy
  attr_writer :admin, :record

  def initialize(admin,record)
    @admin = admin
    @record = record
  end

  def index?
    @user.super_admin? || @user.board_member? || @user.slc?
  end

  def destroy?
    @admin.super_admin?
  end

end