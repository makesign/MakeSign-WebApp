class SlideshowMappingsController < ApplicationController
  before_action :set_slideshow_mapping, only: [:edit, :update]

  def edit
    @slideshow_mapping = SlideshowMapping.find params[:id]
    @screen = Screen.find @slideshow_mapping.screen_id
    @slideshow = Slideshow.find @slideshow_mapping.slideshow_id
  end

  def update
    if @slideshow_mapping.update(slideshow_mapping_params)
      redirect_to screens_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_slideshow_mapping
    @slideshow_mapping = SlideshowMapping.find params[:id]
  end

  def slideshow_mapping_params
    params.require(:slideshow_mapping).permit(:duration)
  end
end
