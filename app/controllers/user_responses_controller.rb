class UserResponsesController < ApplicationController
  def create
    unless params[:response_id] == 194
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
    else

      @user_response = UserResponse.new(
        response: Response.find(params[:response_id]),
        user: current_user,
        free_response: params[:user_response][:free_response]
      )
      @user_response.save
      redirect_to questions_path
    end
  end

  def destroy
    unless params[:response_id] == 194
      user_response = UserResponse.find(params[:id])
      @response = user_response.response
      user_response.destroy
      @user_response = nil
      respond_to do |format|
        format.js { render :insert }
        format.html { redirect_to questions_path }
      end
    else
      @user_response = UserResponse.find(params[:id])
      @user_response.destroy
      @user_response.save
    end
  end
end
