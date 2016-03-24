class BathroomsController < ApplicationController
  def new
    @bathroom = Bathroom.new
  end

  def create
    @bathroom = Bathroom.new(bathroom_params)

    if @bathroom.save
      flash[:notice] = "Bathroom added successfully"
      redirect_to bathrooms_path
    else
      flash[:error] = @bathroom.errors.full_messages.join(", ")
      render :new
    end
  end

  def index
    @bathrooms = Bathroom.all
  end

  def show
    @bathroom = Bathroom.find(params[:id])
    @reviews = @bathroom.reviews
  end

  private

  def bathroom_params
    params.require(:bathroom).permit(:name, :address, :city, :state, :zip, :description)
  end
end
