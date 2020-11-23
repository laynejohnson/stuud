class ClientsController < ApplicationController
  before_action :client_id, only: [:show]
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

  def client_id
    @client = Client.find(params[:id])
  end

  def clients_params
    params.require(:client).permit(:first_name, :last_name, :email, :phone, :address, :color)
  end
end
