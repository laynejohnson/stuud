class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update]
  before_action :set_user, only: [:index]

  def index
    # raise
    if params[:query].present?
      @clients = Client.all.search_by_color(params[:query])
    else
      @clients = Client.where(user_id: @user).order(:first_name)
    end
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
      redirect_to client_path(@client)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @client.update(clients_params)
      redirect_to client_path(@client)
    else
      render :edit
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
    params.require(:client).permit(:first_name, :last_name, :email, :phone, :address, :color, :notes)
  end
end
