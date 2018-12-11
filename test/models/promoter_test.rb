require 'test_helper'

class PromoterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should not save invalid promoter' do
    promoter = Promoter.new
    promoter.save
    refute promoter.valid?
  end

  test 'should save valid promoter' do
    promoter = Promoter.new
    promoter.email = 'bob@example.com'
    promoter.password= '12345678'
    promoter.save
    assert promoter.valid?
  end

end
