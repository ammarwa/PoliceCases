module SessionsHelper
  def log_in(police)
    session[:police_id] = police.id
  end
  def log_out
    session.delete(:police_id)
    session.delete(:admin_id)
  end
  def log_in_admin(admin)
    session[:admin_id] = admin.id
  end
end
