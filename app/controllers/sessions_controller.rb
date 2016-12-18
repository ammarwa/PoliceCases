class SessionsController < ApplicationController
  def new
    if session[:police_id] == nil
      if session[:admin_id] == nil
        @police = Police.all
      else
        redirect_to admins_path
      end
    else
      redirect_to police_index_url
    end
  end

  def create
    if params[:session][:desired_attribute] == "Police"
      if session[:police_id] == nil
        police = Police.find_by(username: params[:session][:username].downcase)
        if police && police.authenticate(params[:session][:password])
          log_in police
          redirect_to police

          # Log the user in and redirect to the user's show page.
        else
          flash[:notice] = 'Invalid Police email/password combination'
          render 'new'
        end
      else
        police = Police.find(session[:police_id])
        redirect_to police
      end
    else
      if session[:admin_id] == nil
        admin = Admin.find_by(username: params[:session][:username].downcase)
        if admin && admin.authenticate(params[:session][:password])
          log_in_admin admin
          redirect_to admins_path

          # Log the user in and redirect to the user's show page.
        else
          flash[:notice] = 'Invalid Admin email/password combination'
          render 'new'
        end
      else
        admin = Admin.find(session[:admin_id])
        redirect_to admins_path
      end
    end
  end

  def destroy
    log_out
    render 'new'
  end
end
