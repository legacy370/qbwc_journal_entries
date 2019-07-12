class GlAccountsController < ApplicationController

  def index
    @gl_accounts = QbCoa.order(:account_type, :full_name)
  end

  def show
    @gl_account = QbCoa.find(params[:id])
  end

  def new
    @gl_account = QbCoa.new
  end

  def edit
    @gl_account = QbCoa.find(params[:id])
  end


  def create
    @gl_account = QbCoa.new(gl_account_params)
    if @gl_account.save
      redirect_to @gl_account
    else
      render 'new'
    end
  end

  def update
    @gl_account = QbCoa.find(params[:id])
    if @gl_account.update(gl_account_params)
      redirect_to @gl_account
    else
      render 'edit'
    end
  end

  def destroy
    @gl_account = QbCoa.find(params[:id])
    @gl_account.destroy
    redirect_to gl_accounts_path
  end

  private

  def gl_account_params
    params.require(:gl_account).permit(:qb_list_id, :edit_sequence, :name, :full_name, :account_type)
  end
end
