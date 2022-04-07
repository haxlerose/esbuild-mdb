# frozen_string_literal: true

class HomeController < ApplicationController
  def show
    @home_data = test_data
  end

  private

  def test_data
    {
      columns: [
        { label: 'Tenant', width: 100, fixed: true, sort: false },
        { label: 'ID' },
        { label: 'Type' },
        { label: 'Severity' },
        { label: 'Time' },
        { label: 'Source' },
        { label: 'Destination' },
        { label: 'Account' },
        { label: 'Info' }
      ],
      rows: data_rows(111)
    }.to_json
  end

  def data_rows(amount)
    (1..amount).each_with_object([]) do |_, array|
      sd = source_destination
      array << [tenant, id, type, severity, time, sd, sd, account, info]
    end
  end

  def tenant
    Faker::Name.first_name
  end

  def id
    rand(1..999_999)
  end

  def type
    Faker::Hacker.noun
  end

  def severity
    %w[low medium high critical][rand(0..3)]
  end

  def time
    DateTime.now - rand(1..160_000).minutes
  end

  def source_destination
    Faker::Space.galaxy
  end

  def account
    rand(1..1000)
  end

  def info
    Faker::Hipster.paragraphs
  end
end
