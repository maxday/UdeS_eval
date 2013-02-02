require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "User username and email fields must not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:username].any?
    assert user.errors[:email].any?
  end


  test "User username and email fields must not be unique" do
    user = User.new(:email => "a@a.a", :username=>"a", :password => "aaaaaaaa", :password_confirmation => "aaaaaaaa")
    assert user.valid?
    assert user.save
    #same email
    user = User.new(:email => "a@a.a", :username=>"b", :password => "aaaaaaaa", :password_confirmation => "aaaaaaaa")
    assert user.invalid?
    #same username
    user = User.new(:email => "b@b.b", :username=>"a", :password => "aaaaaaaa", :password_confirmation => "aaaaaaaa")
    assert user.invalid?
  end


end
