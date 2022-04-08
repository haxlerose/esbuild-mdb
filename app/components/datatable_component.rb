# frozen_string_literal: true

class DatatableComponent < ViewComponent::Base
  def initialize(data:, config:, style:)
    @data = data
    @config = config
    @style = style
  end
end
