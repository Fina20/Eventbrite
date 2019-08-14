class SessionsController < ApplicationController
	def new
  end

  def create
  	 user = User.find_by(id: params[:session][:id])
    if user 
      log_in user
      flash[:success] = 'Connected'
      redirect_to user
      
    else
      flash.now[:danger] = 'Invalid ID'
      render 'new'
    end
  end

  def destroy
  	log_out
  	flash[:success] = 'sucessfully disconnected'
  	redirect_to root_url
  end
end
