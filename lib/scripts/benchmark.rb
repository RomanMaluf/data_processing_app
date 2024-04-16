# frozen_string_literal: true

require 'benchmark'
require_relative 'simulate_data_with_threads'
require_relative 'simulate_data_with_fibers'

num_transactions = 5 # Número de transacciones que cada script debe procesar

Benchmark.bmbm do |x|
  x.report('Threads:') { run_threads_simulation(num_transactions) }
  x.report('Fibers:')  { run_fibers_simulation(num_transactions) }
end

# puts bm
# bm
