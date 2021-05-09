class WelcomeController < ApplicationController

  def index
    @extratos = Order.bank_statement(current_account.id)
  end

  def deposito
    @order = Order.new
  end

  def saque
    @order = Order.new
  end

  def transferencia
    @order = Order.new
  end

end
