require 'test_helper'

class WalltypeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Walltype.new.valid?
  end
end
