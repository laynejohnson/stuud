class ClientsController < ApplicationController
  before_action :set_client, only: [:show]
  def index
    @clients = Client.all
  end

  def show
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(clients_params)
    @client.user = current_user
    if @client.save
      redirect_to clients_path
    else
      render :new
    end
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def clients_params
    params.require(:client).permit(:first_name, :last_name, :email, :phone, :address, :color)
  end
end
