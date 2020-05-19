class HamstersController < ApplicationController
    before_action :set_hamster, only: [:show, :update, :destroy]

  # GET /hamsters
  def index
    @hamsters = Hamster.all

    render json: @hamsters
  end

  # GET /hamsters/1
  def show
    render json: @hamster
  end

  # POST /hamsters
  def create
    @hamster = Hamster.new(hamster_params)

    if @hamster.save
      render json: @hamster, status: :created, location: @hamster
    else
      render json: @hamster.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hamsters/1
  def update
    if @hamster.update(hamster_params)
      render json: @hamster
    else
      render json: @hamster.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hamsters/1
  def destroy
    @hamster.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hamster
      @hamster = Hamster.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hamster_params
      params.require(:hamster).permit(:name, :age)
    end
end
