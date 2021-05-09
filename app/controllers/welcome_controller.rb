class WelcomeController < ApplicationController

  def index
    @extratos = Order.bank_statement(current_account)
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

  def extrato
  look = params['date_start'].nil?

  if look
    @inicio = Date.today - 5
    @fim = Date.today + 1
  elsif params['date_start'] == '' || params['date_end'] == ''
    @inicio = Date.today - 5
    @fim = Date.today + 1
  elsif params['date_start'] > params['date_end']
    @inicio = Date.today - 5
    @fim = Date.today + 1
  else
    @inicio = params['date_start'].to_datetime
    @fim = change_date(params['date_end']).to_datetime
  end
end

private

def change_date(data)
  dt = data.split('-')
  set_data = Date.new(dt[0].to_i,dt[1].to_i,dt[2].to_i + 1)
end

end
