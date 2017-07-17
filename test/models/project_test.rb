require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  
  def setup
    @project = Project.new(name: "Spectral", tagline: "Simple recipe site", 
                           description: "Awesome website for recipes", 
                           link: "https://spectrall.herokuapp.com", 
                           github: "https://github.com/faisalhassanx/spectral")
  end
  
  test "project should be valid" do
    assert @project.valid?
  end
  
  test "name should be present" do
    @project.name = " "
    assert_not @project.valid?
  end
  
end