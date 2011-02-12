class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def new
    @title = "Login"
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    
    respond_to do |format|
      if @user_session.save
        format.html { redirect_to root_path, :notice => "Login successful!" }
      else
        format.html { redirect_to(new_user_session_path, :notice => @user_session.errors) }
      end
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to root_path
  end
end
