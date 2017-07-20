require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  
  def setup
    @developer = Developer.create(name: "Faisal", email: "faisal@example.com", 
                           website: "https://faisalhassanx.bitbucket.io/", 
                           github: "https://github.com/faisalhassanx",
                           password: "password", password_confirmation: "password")
    @project = @developer.projects.build(name: "Spectral", tagline: "Simple recipe site", 
                           description: "Awesome website for recipes Awesome website for recipes Awesome website for recipes Awesome website for recipes ", 
                           link: "https://spectrall.herokuapp.com", 
                           github: "https://github.com/faisalhassanx/spectral")
  end
  
  test "project without developer should be invalid" do
    @project.developer_id = nil
    assert_not @project.valid?
  end
  
  test "project should be valid" do
    assert @project.valid?
  end
  
  test "name should be present" do
    @project.name = " "
    assert_not @project.valid?
  end
  
  test "tagline should be present" do
    @project.tagline = " "
    assert_not @project.valid?
  end
  
  test "description should be present" do
    @project.description = " "
    assert_not @project.valid?
  end
  
  test "link should be present" do
    @project.link = " "
    assert_not @project.valid?
  end
  
  test "name should not be more than 35 characters" do
    @project.name = "a" * 36
    assert_not @project.valid?
  end
  
  test "tagline should not be more than 60 characters" do
    @project.tagline = "a" * 81
    assert_not @project.valid?
  end
  
  test "description should be more than 100 characters" do
    @project.description = "a" * 99
    assert_not @project.valid?
  end
  
  test "description should be less than 1000 characters" do
    @project.description = "a" * 1001
    assert_not @project.valid?
  end
  
  test "link should not be more than 50 characters" do
    @project.link = "a" * 51
    assert_not @project.valid?
  end
  
  test "github should not be more than 50 characters" do
    @project.github = "a" * 51
    assert_not @project.valid?
  end
  
end