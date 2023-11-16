class AdminController < ApplicationController
  def index
    @total_orders = User.count
  end
end
