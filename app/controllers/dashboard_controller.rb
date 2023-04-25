# frozen_string_literal: true

# DashboardController
class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @should_render_navbar = true
  end
end
