class Api::V1::AirlinesController < ApplicationController
  protect_from_forgery with: :null_session
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::ParameterMissing, with: :parameter_missing
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  before_action :set_airline, only: %i[show edit update destroy]

  # GET /airlines or /airlines.json
  def index
    @airlines = Airline.all

    render json: AirlineSerializer.new(@airlines, options).serializable_hash.to_json
  end

  # GET /airlines/1 or /airlines/1.json
  def show
    render json: AirlineSerializer.new(@airline, options).serializable_hash.to_json
  end

  # GET /airlines/new
  def new
    @airline = Airline.new
  end

  # GET /airlines/1/edit
  def edit; end

  # POST /airlines or /airlines.json
  def create
    @airline = Airline.new(airline_params)

    if @airline.save
      render json: AirlineSerializer.new(@airline).serializable_hash.to_json, status: :created
    else
      render json: @airline.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /airlines/1 or /airlines/1.json
  def update
    if @airline.update(airline_params)
      render json: AirlineSerializer.new(@airline, options).serializable_hash.to_json
    else
      render json: @airline.errors, status: :unprocessable_entity
    end
  end

  # DELETE /airlines/1 or /airlines/1.json
  def destroy
    @airline.destroy!

    if @airline.destroy
      head :no_content
    else
      render json: @airline.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_airline
    @airline = Airline.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def airline_params
    params.require(:airline).permit(:name, :image_url)
  end

  def options
    @options ||= { include: %i[reviews] }
  end

  def record_not_found
    render json: { error: 'Airline not found' }, status: :not_found
  end

  def parameter_missing
    render json: { error: 'Missing parameter' }, status: :unprocessable_entity
  end

  def record_invalid(exception)
    render json: { error: exception.record.errors.full_messages.join(',') }, status: :unprocessable_entity
  end
end
