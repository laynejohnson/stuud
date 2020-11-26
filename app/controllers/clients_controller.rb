class ClientsController < ApplicationController
  before_action :set_client, only: [:show]
  before_action :set_user, only: [:index]

  def index
    @clients = Client.where(user_id: @user)
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

  def set_user
    @user = current_user
  end

  def set_client
    @client = Client.find(params[:id])
  end

  def clients_params
    params.require(:client).permit(:first_name, :last_name, :email, :phone, :address, :color)
  end
end
