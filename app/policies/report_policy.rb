class ReportPolicy < Struct.new(:user, :report)
  
  def show?
    user.super_admin? || user.board_member? || user.slc?
  end

  def financial?
    user.super_admin? || user.board_member?
  end

end