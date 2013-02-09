require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  test "Category name must not be empty" do
    category = Category.new
    assert category.invalid?
    assert category.errors[:name].any?
  end


  test "Category name must be unique" do
    category = Category.new(:name => "a")
    assert category.valid?
    category.save
    category = Category.new(:name => "a")
    assert category.invalid?
  end
  
end
