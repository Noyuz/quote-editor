require "test_helper"
require "selenium/webdriver"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Warden::Test::Helpers

  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
end
