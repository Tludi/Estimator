require 'test_helper'

class TakeoffTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Takeoff.new.valid?
  end
end
