class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # @navbar_home = true need it if we use two navbar
  end
end
