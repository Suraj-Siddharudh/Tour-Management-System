require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save User without first_name" do
    user = User.new
    assert_not user.save
  end
  
  test "should not save user with invalid email" do
    user = User.new do |user_test|
      user_test.first_name = "User"
      user_test.email = "abc"
      user_test.password = "password"
    end
    begin
      assert_not user.save!
    rescue
      assert_not user.id
    end
  end

  test "should not save user with password less than 6 chars" do
    user = User.new
    user.first_name = "User"
    user.email = "user12888993456@gmail.com"
    user.password = "pas"
    assert_not user.save
  end

  test "should not save user with existing email" do
    user = User.new
    user.first_name = "User"
    user.email = "admin@touringapp.com"
    user.password = "password"
    user.is_admin = 1
    assert_not user.save
end
test "truth" do
  assert true
end
end
