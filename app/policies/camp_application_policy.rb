class CampApplicationPolicy
  attr_reader :user, :record

  def initialize(user,record)
    @user = user
    @record = record
  end

  def index?
    user.super_admin? || user.board_member? || user.slc?
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    user.super_admin? || user.board_member?
  end

  def edit?
    update?
  end

  def update?
    true
  end

  def destroy?
    user.super_admin? || user.board_member?
  end
end