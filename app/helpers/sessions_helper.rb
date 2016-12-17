module SessionsHelper
  def log_in(police)
    session[:police_id] = police.id
  end
  def log_out
    session.delete(:police_id)
  end
end
