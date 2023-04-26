# frozen_string_literal: true

# DashboardController
class DashboardController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_user, only: [:show]

  def index
    @should_render_navbar = true
  end

  def show
    redirect_to dashboard_path if @user.nil?
  end

  def appearance
    @should_render_navbar = true
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  rescue StandardError
    @user = nil
  end
end
