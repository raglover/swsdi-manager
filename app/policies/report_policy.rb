class ReportPolicy < Struct.new(:user, :report)
  
  def show?
    user.super_admin? || user.board_member?
  end

end