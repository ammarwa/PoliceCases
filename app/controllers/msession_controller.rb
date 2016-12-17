class MsessionController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
 		email, password = session_params.values_at(:email, :password)

		if person = Person.where(:email => email , :password => password).first
			render text: "#{person.id}", status: :ok
 		else
 			render status: :bad_request
 		end
	end

	def new
	end



      protected
	def session_params
		params.permit(:email, :password)
	end

end
