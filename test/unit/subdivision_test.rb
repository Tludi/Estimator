require 'test_helper'

class SubdivisionTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Subdivision.new.valid?
  end
end
