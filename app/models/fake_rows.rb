# frozen_string_literal: true

class FakeRows
  class << self
    def data(amount)
      (1..amount).each_with_object([]) do |_, array|
        sd = source_destination
        array << [id, tenant, type, severity, time, sd, sd, account, info]
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
end
