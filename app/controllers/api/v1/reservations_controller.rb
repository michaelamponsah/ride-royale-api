class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show destroy]

  def show
    render json: @reservation
  end

  def destroy
    if @reservation.destroy
      head :no_content
    else
      render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def create
    @user = User.find(params[:user_id])
    @reservation = @user.reservations.new(reservation_params)

    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def index
    @reservations = User.find(params[:user_id]).reservations
    @result = []
    @reservations.each do |res|
      @result << { reservation: res, car: Car.find(res.car_id) }
    end
    render json: { reservations: @result }, status: :ok
  end

  private

  def reservation_params
    params.require(:reservation).permit(:car_id, :city, :date)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def authenticate_user!
    return if user_signed_in?

    render json: {
      code: 401,
      message: 'Unauthorized access'
    }, status: :unauthorized
  end
end
