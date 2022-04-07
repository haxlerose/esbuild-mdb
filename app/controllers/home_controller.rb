# frozen_string_literal: true

class HomeController < ApplicationController
  def show
    @home_data = test_data
    puts ">>>>> DATA FROM CONTROLLER: #{@home_data}"
  end

  private

  def test_data
    {
      columns: [
        { label: 'Tenant', width: 100, fixed: true, sort: false },
        { label: 'Column 2'}
      ],
      rows: [
        [],
        []
      ]
    }
  end
end
