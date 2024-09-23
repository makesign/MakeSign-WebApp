# frozen_string_literal: true

class SlideMappingsController < ApplicationController
  before_action :set_slide_mapping, only: [:edit, :update]

  def edit
    @slide_mapping = SlideMapping.find params[:id]
    @slideshow = Slideshow.find @slide_mapping.slideshow_id
    @slide = Slide.find @slide_mapping.slide_id
  end

  def update
    if @slide_mapping.update(slide_mapping_params)
      redirect_to slideshows_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_slide_mapping
    @slide_mapping = SlideMapping.find params[:id]
  end

  def slide_mapping_params
    params.require(:slide_mapping).permit(:duration)
  end
end
