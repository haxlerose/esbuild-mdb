# frozen_string_literal: true

class HomeController < ApplicationController
  def show
    @home_data = test_data
    puts ">>>>> DATA FROM CONTROLLER: #{@home_data}"
  end

  private

  def test_data
    sd = source_destination
    {
      'columns' => [
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
      rows: [
        [tenant, id, type, severity, time, sd, sd, account, info],
        [tenant, id, type, severity, time, sd, sd, account, info],
        [tenant, id, type, severity, time, sd, sd, account, info],
        [tenant, id, type, severity, time, sd, sd, account, info],
        [tenant, id, type, severity, time, sd, sd, account, info],
        [tenant, id, type, severity, time, sd, sd, account, info],
        [tenant, id, type, severity, time, sd, sd, account, info],
        [tenant, id, type, severity, time, sd, sd, account, info],
        [tenant, id, type, severity, time, sd, sd, account, info],
        [tenant, id, type, severity, time, sd, sd, account, info]
      ]
    }.to_json
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
