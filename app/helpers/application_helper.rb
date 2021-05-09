module ApplicationHelper

  def list_favored(current)
    Account.all.map { |account| [account.name, account.id] if account != current }
  end

  def extrato(conta, date_start = DateTime.now - 5, date_end = DateTime.now)
    Order.where("account_id = ? OR favored_id = ?", conta.id, conta.id)
                      .where("created_at >= ? AND created_at <= ?", date_start, date_end)
  end

end
