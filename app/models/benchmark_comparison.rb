# frozen_string_literal: true

class BenchmarkComparison
  # Configure Rails Environment
  # ENV['RAILS_ENV'] = 'production'

  def initialize
    @args = arguments
    @controller_view = ActionController::Base.new.view_context
  end

  def arguments
    {
      data: FakeRows.data(111),
      config: [
        { label: 'ID', fixed: true },
        { label: 'Tenant', width: 100, fixed: false, sort: false },
        { label: 'Type' },
        { label: 'Severity' },
        { label: 'Time' },
        { label: 'Source' },
        { label: 'Destination' },
        { label: 'Account' },
        { label: 'Info' }
      ],
      style: {
        bordered: true,
        dark: false,
        striped: true
      }
    }
  end

  def compare(time, warmup)
    Benchmark.ips do |benchmark|
      benchmark.time = time
      benchmark.warmup = warmup

      benchmark.report('component') { @controller_view.render DatatableComponent.new(@args) }
      benchmark.report('partial') { @controller_view.render 'components/datatable', @args }

      benchmark.compare!
    end
  end
end
