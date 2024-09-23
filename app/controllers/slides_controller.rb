# frozen_string_literal: true

class SlidesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_slide, only: [:show, :edit, :update, :destroy]

  def index
    @slides = Slide.all
  end

  def show
  end

  def new
    @slide = Slide.new
  end

  def create
    @slide = Slide.new(slide_params)
    if @slide.save
      redirect_to @slide
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @slide.update(slide_params)
      redirect_to @slide
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @slide.destroy
    redirect_to slides_path
  end

  private

  def set_slide
    @slide = Slide.find(params[:id])
  end

  def slide_params
    params.require(:slide).permit(:name, :image)
  end
end
