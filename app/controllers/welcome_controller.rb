class WelcomeController < ApplicationController

  def index
    @extratos = Order.bank_statement(current_account)
  end

end
