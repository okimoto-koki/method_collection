class HomeController < ApplicationController
  before_filter :authenticate_user! #devise認証が必須

  def index
  end

  def new
  	
  end
end
