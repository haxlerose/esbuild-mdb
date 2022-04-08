# frozen_string_literal: true

class HomeController < ApplicationController
  def using_partial
    @data = data_rows(111)
  end

  def using_view_component
    @data = data_rows(111)
  end

  private

  def data_rows(amount)
    FakeRows.data(amount)
  end
end
