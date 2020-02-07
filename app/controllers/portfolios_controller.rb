# frozen_string_literal: true

# Controller Action for Portfolios
class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_item_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html do
          redirect_to @portfolio_item, notice: 'Portfolio item is now live.'
        end
      else
        format.html { render :new }
      end
    end
  end

  private

  def portfolio_item_params
    params
      .require(:portfolio)
      .permit(:title, :body, :subtitle, :main_image, :thumb_image)
  end
end
