require 'test_helper'

class ProjectsTest < ActionDispatch::IntegrationTest
  
  def setup
    @developer = Developer.create!(name: "Faisal", email: "faisal@example.com", 
                           website: "https://faisalhassanx.bitbucket.io/", 
                           github: "https://github.com/faisalhassanx")
    @project = Project.create(name: "Spectral", tagline: "Simple recipe site", 
                           description: "Awesome website for recipes Awesome website for recipes Awesome website for recipes Awesome website for recipes ", 
                           link: "https://spectrall.herokuapp.com", 
                           github: "https://github.com/faisalhassanx/spectral",
                           developer: @developer)
    @project2 = @developer.projects.build(name: "Spectral", tagline: "Simple recipe site", 
                           description: "Awesome website for recipes Awesome website for recipes Awesome website for recipes Awesome website for recipes ", 
                           link: "https://spectrall.herokuapp.com", 
                           github: "https://github.com/faisalhassanx/spectral")
    @project2.save
  end
  
  test 'should get projects index' do
    get projects_path
    assert_response :success
  end
  
  test "should get projects listing" do
    get projects_path
    assert_template 'projects/index'
    assert_match @project.name, response.body
    assert_match @project2.name, response.body
  end
end
