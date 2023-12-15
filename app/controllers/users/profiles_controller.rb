# frozen_string_literal: true

class Users::ProfilesController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders=current_user.orders.group(:product_id)
  end
end
