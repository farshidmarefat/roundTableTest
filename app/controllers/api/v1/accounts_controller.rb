class Api::V1::AccountsController < ApplicationController
  include Pundit::Authorization
  before_action :authenticate_user!

  # GET /accounts
  def index
    @accounts = Account.all
    authorize @accounts
    render json: @accounts, status: :ok
  end

  # GET /accounts/id
  def show
    account = Account.find_by(id: params[:id])
    authorize account

    render json: account.to_json
  end

  # POST /accounts
  def create
    @account = Account.new(account_params)
    authorize @account

    if @account.save
      render json: @account, status: :created
    else
      render json: { errors: @account.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /accounts/id
  def update
    find_account
    authorize @account

    unless @account.update(account_params)
      render json: { errors: @account.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /accounts/id
  def destroy
    find_account
    authorize @account

    @account.destroy
  end

  private

  def find_account
    @account = Account.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Account not found' }, status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def account_params
    params.permit(
      :name, :email, :mobile, :description
    )
  end
end
