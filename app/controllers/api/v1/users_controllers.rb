class Api::V1::UsersController < ApplicationController
  def index
    render json: { users: User.all }, status: :ok
  end
end
