class CarsController < ApplicationController

def index
  @cars = Car.all
end

def new
  @car = Car.new
end

def create
  @car = Car.new(car_params)
  if @car.save
    redirect_to root_path
  else
    render :new
  end
end

def edit
  @car = Car.find(params[:id])
end

def update
  @car = Car.find(params[:id])
  @car.update(car_params)
  # Will raise ActiveModel::ForbiddenAttributesError
  redirect_to root_path
end

def destroy
  @car = Car.find(params[:id])
  @car.destroy
  redirect_to root_path
end


private

def car_params
  params.require(:car).permit(:name, :entry_time, :bye_time)
end
end
