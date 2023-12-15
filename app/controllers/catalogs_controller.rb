# frozen_string_literal: true

class CatalogsController < ApplicationController

  def index
    @categories=Category.all
  end

  def new
    @category= Category.new
  end

  def show
    @products = category.products
  end

  def create
    @category = Category.create(name: create_params[:name],
                                image_url: create_params[:image_url]
                                             .original_filename )

    FileUtils.cp(params[:category][:image_url].tempfile.path,
                 "/Users/user/uniq/techoshop/app/assets/images/#{params[:category][:image_url]
                                                                   .original_filename}")

    redirect_to catalogs_path
  end

  def destroy
    category.destroy
    redirect_to catalogs_path
  end

  private

  def create_params
    params.require(:category).permit(:name, :image_url)
  end

  def category
    @category ||= Category.find(params[:id])
  end
end
