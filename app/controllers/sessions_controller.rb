class SessionsController < ApplicationController
  def new
    if session[:police_id] == nil
      @police = Police.all
    else
      police = Police.find(session[:police_id])
      redirect_to police
    end
  end

  def create
    if session[:police_id] == nil
      police = Police.find_by(username: params[:session][:username].downcase)
      if police && police.authenticate(params[:session][:password])
        log_in police
        redirect_to police

        # Log the user in and redirect to the user's show page.
      else
        flash[:notice] = 'Invalid email/password combination'
        render 'new'
      end
    else
      police = Police.find(session[:police_id])
      redirect_to police
    end
  end

  def destroy
    log_out
    render 'new'
  end
end
