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

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(portfolio_item_params)
        format.html do
          redirect_to @portfolio_item, notice: 'Portfolio item was updated.'
        end
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    @portfolio_item = Portfolio.find(params[:id])

    @portfolio_item.destroy

    respond_to do |format|
      format.html do
        redirect_to portfolios_url, notice: 'Portfolio item was removed.'
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
