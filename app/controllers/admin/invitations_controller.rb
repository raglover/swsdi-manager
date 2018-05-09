class Admin::InvitationsController < Devise::InvitationsController


	def after_invite_path_for(resource)
		admin_admins_path
	end

	def after_accept_path_for(resource)
		new_admin_admin_profile_path
	end
end