require 'test_helper'

class WallLayersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => WallLayer.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    WallLayer.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    WallLayer.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to wall_layer_url(assigns(:wall_layer))
  end

  def test_edit
    get :edit, :id => WallLayer.first
    assert_template 'edit'
  end

  def test_update_invalid
    WallLayer.any_instance.stubs(:valid?).returns(false)
    put :update, :id => WallLayer.first
    assert_template 'edit'
  end

  def test_update_valid
    WallLayer.any_instance.stubs(:valid?).returns(true)
    put :update, :id => WallLayer.first
    assert_redirected_to wall_layer_url(assigns(:wall_layer))
  end

  def test_destroy
    wall_layer = WallLayer.first
    delete :destroy, :id => wall_layer
    assert_redirected_to wall_layers_url
    assert !WallLayer.exists?(wall_layer.id)
  end
end
