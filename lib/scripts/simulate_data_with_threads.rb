# frozen_string_literal: true

require './config/environment'

# Método para simular la generación de datos
def simulate_data(user_ids)
  # loop do
  user_id = user_ids.sample
  amount = rand(1.0..1000.0).round(2)
  transaction_type = %w[deposit withdrawal].sample
  status = %w[pending completed failed].sample
  ProcessTransactionJob.perform_async(user_id, amount, transaction_type, status)
  sleep(rand(0.1..0.5))
  # end
end

def run_threads_simulation(num_transactions)
  user_ids = User.pluck(:id)
  threads = []
  num_transactions.times do
    threads << Thread.new { simulate_data(user_ids) }
  end

  threads.each(&:join)
end
