# frozen_string_literal: true

class ProcessTransactionJob
  include Sidekiq::Job

  def perform(user_id, amount, transaction_type, status)
    Rails.logger.debug 'Creating Transaction'
    Transaction.create!(
      user_id:,
      amount:,
      transaction_type:,
      status:
    )
    Rails.logger.debug 'Ending Transaction'
  end
end
