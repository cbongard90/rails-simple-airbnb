class FlatsController < ApplicationController
  before_action :find_flat, except: :index

  def index
    if params[:query].present?
      @flats = Flat.where("name LIKE ?", "%#{params[:query]}%")
    else
      @flats = Flat.all
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      flash[:success] = "Object successfully created"
      redirect_to @flat
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @flat.update_attributes(flat_params)
      flash[:success] = "Flat was successfully updated"
      redirect_to @flat
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    if @flat.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to flats_path
    else
      flash[:error] = 'Something went wrong'
      render :show
    end
  end



  private

  def flat_params
    params.require(:flat).permit(:name, :address, :descripiton, :price_per_night, :number_of_guests)
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end
end
