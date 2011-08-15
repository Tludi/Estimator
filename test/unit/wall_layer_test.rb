require 'test_helper'

class WallLayerTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert WallLayer.new.valid?
  end
end
