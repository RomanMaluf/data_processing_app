# frozen_string_literal: true

require './config/environment'

def user_ids
  User.pluck(:id)
end

def transaction_fiber
  Fiber.new do
    loop do
      user_id = user_ids.sample
      amount = rand(1.0..1000.0).round(2)
      transaction_type = %w[deposit withdrawal].sample
      status = %w[pending completed failed].sample
      Fiber.yield [user_id, amount, transaction_type, status]
      sleep(rand(0.1..0.5))
    end
  end
end

def run_fibers_simulation(num_transactions)
  # Fiber para simular la generación de datos
  fiber = transaction_fiber

  num_transactions.times do
    transaction_data = fiber.resume
    ProcessTransactionJob.perform_async(*transaction_data)
  end
end
