# frozen_string_literal: true

module All
  Dir["#{File.dirname(__FILE__)}/**/*.rb"].each { |file| require file }
end
