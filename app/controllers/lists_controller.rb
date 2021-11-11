class ListsController < ApplicationController
  before_action :get_list, only: [:show]

  def index
    @lists = List.all
  end

  def show; end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    if @list.save
      redirect_to list_path(@list), notice: 'List was successfully created.'
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def get_list
    @list = List.find(params[:id])
  end
end
