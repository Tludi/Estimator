require 'test_helper'

class DashboardTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Dashboard.new.valid?
  end
end
