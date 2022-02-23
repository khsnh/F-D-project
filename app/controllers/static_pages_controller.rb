class StaticPagesController < ApplicationController
  skip_before_action :find_cart
  def home
  end

  def help
  end

  def contact
  end
end
