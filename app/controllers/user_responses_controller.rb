class UserResponsesController < ApplicationController
  def create
    @user_response = UserResponse.new(
      response: Response.find(params[:response_id]),
      user: current_user
    )
    @response = @user_response.response
    @user_response.save
    respond_to do |format|
      format.js { render :insert }
      format.html { redirect_to questions_path }
    end
  end

  def destroy
    user_response = UserResponse.find(params[:id])
    @response = user_response.response
    user_response.destroy
    @user_response = nil
    respond_to do |format|
      format.js { render :insert }
      format.html { redirect_to questions_path }
    end
  end
end
