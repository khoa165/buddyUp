class UserResponsesController < ApplicationController
  def create
    user_responses_params[:response_ids].each do |response_id|
      UserResponse.create(response_id: response_id, user: current_user)
    end
  end

  private

  def user_responses_params
    params.require(:user_responses).permit(response_ids: [])
  end
end
