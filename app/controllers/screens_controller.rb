# frozen_string_literal: true

class ScreensController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :display]
  before_action :set_screen, only: [:show, :edit, :update, :destroy]

  def index
    @screens = Screen.all
  end

  def show
  end

  def display
    @screen = Screen.find(params[:id])
    @hide_navbar = true
  end

  def new
    @screen = Screen.new
  end

  def create
    @screen = Screen.new(screen_params)
    if @screen.save
      redirect_to @screen
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @screen.update(screen_params)
      redirect_to @screen
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @screen.destroy
    redirect_to screens_url
  end

  private

  def set_screen
    @screen = Screen.find(params[:id])
  end

  def screen_params
    params.require(:screen).permit(:name, slideshow_ids: [])
  end
end
