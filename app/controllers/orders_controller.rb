class OrdersController < ApplicationController

  def create
    @order = current_account.orders.new(order_params)

    if @order.type_order == 'deposito'
      if @order.save
        redirect_to root_path, notice: 'Depósito efetuado com sucesso!!!'
      else
        redirect_to deposito_path, alert: @order.errors.full_messages
      end

    elsif @order.type_order == 'saque'
      if @order.saque_permited?
        if @order.save
          redirect_to root_path, notice: 'Saque efetuado com sucesso!!!'
        else
          redirect_to deposito_path, alert: @order.errors.full_messages
        end
      else
        redirect_to saque_path, alert: 'Saldo insuficiente!'
      end

    elsif @order.type_order == 'transferencia'
      if @order.balance_ted?
        @order.fee = @order.setting_fee
        if @order.save
          redirect_to root_path, notice: 'Ted efetuado com sucesso!!!'
        else
          redirect_to deposito_path, alert: @order.errors.full_messages
        end
      else
        redirect_to transferencia_path, alert: 'Saldo Insuficiente!!!'
      end

    end

  end

  private

  def order_params
    params.require(:order).permit(:type_order, :value, :fee, :status, :favored_id)
  end

end
