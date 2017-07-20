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
    assert_select "a[href=?]", project_path(@project), text: @project.name
    assert_select "a[href=?]", project_path(@project2), text: @project2.name
  end
  
  test 'should get projects show page' do
    get project_path(@project)
    assert_template 'projects/show'
    assert_match @project.name.titleize, response.body
    assert_match @project.tagline.titleize, response.body
    assert_match @project.description, response.body
    assert_match @developer.name.titleize, response.body
  end
  
  test "create new valid projects" do
    get new_project_path
  end
  
  test "reject invalid project submissions" do
    get new_project_path
  end
end
