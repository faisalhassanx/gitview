require 'test_helper'

class DeveloperTest < ActiveSupport::TestCase
  
  def setup
    @developer = Developer.new(name: "Faisal", email: "faisal@example.com", 
                           website: "https://faisalhassanx.bitbucket.io/", 
                           github: "https://github.com/faisalhassanx")
  end
  
  test "developer should be valid" do
    assert @developer.valid?
  end
  
  test "name should be present" do
    @developer.name = " "
    assert_not @developer.valid?
  end
  
  test "email should be present" do
    @developer.email = " "
    assert_not @developer.valid?
  end
  
  test "name should not be more than 60 characters" do
    @developer.name = "a" * 61
    assert_not @developer.valid?
  end
  
  test "email should not be more than 100 characters" do
    @developer.email = "a" * 101
    assert_not @developer.valid?
  end
  
  test "website should not be more than 50 characters" do
    @developer.website = "a" * 51
    assert_not @developer.valid?
  end
  
  test "github should not be more than 50 characters" do
    @developer.github = "a" * 51
    assert_not @developer.valid?
  end
  
end