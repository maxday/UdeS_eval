require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  test "Project name must not be empty" do
    project = Project.new
    assert project.invalid?
    assert project.errors[:name].any?
  end


  test "Project name must be unique" do
    project = Project.new(:name => "a")
    assert project.valid?
    project.save
    project = Project.new(:name => "a")
    assert project.invalid?
  end

end
