# frozen_string_literal: true

class SlideshowsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_slideshow, only: [:show, :edit, :update, :destroy, :manage]

  def index
    @slideshows = Slideshow.all
  end

  def show
  end

  def new
    @slideshow = Slideshow.new
  end

  def create
    @slideshow = Slideshow.new(slideshow_params)
    if @slideshow.save
      redirect_to edit_slideshow_path(@slideshow)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @slideshow.update(slideshow_params)
      redirect_to @slideshow
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @slideshow.destroy
    redirect_to slideshows_url
  end

  def manage
  end

  private

  def set_slideshow
    @slideshow = Slideshow.find(params[:id])
  end

  def slideshow_params
    params.require(:slideshow).permit(:name, slide_ids: [], slide_mappings_attributes: [:id, :duration, :expiry_date, :_destroy])
  end
end
