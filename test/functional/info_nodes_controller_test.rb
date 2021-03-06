require File.dirname(__FILE__) + '/../test_helper'
require 'info_nodes_controller'

# Re-raise errors caught by the controller.
class InfoNodesController; def rescue_action(e) raise e end; end

class InfoNodesControllerTest < Test::Unit::TestCase
  fixtures :info_nodes

  def setup
    @controller = InfoNodesController.new
    request  = ActionController::TestRequest.new
    response = ActionController::TestResponse.new
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:info_nodes)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:info_node)
    assert assigns(:info_node).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:info_node)
  end

  def test_create
    num_info_nodes = InfoNode.count

    post :create, :info_node => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_info_nodes + 1, InfoNode.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:info_node)
    assert assigns(:info_node).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil InfoNode.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      InfoNode.find(1)
    }
  end
end
