class CampPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def new?
    create?
  end

  def show?
    true
  end

  def create?
    user.super_admin?
  end

  def edit?
    update?
  end

  def update?
    user.super_admin? || user.board_member?
  end

  def destroy?
    user.super_admin?
  end

end