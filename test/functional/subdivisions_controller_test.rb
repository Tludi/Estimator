require 'test_helper'

class SubdivisionsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Subdivision.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Subdivision.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Subdivision.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to subdivision_url(assigns(:subdivision))
  end

  def test_edit
    get :edit, :id => Subdivision.first
    assert_template 'edit'
  end

  def test_update_invalid
    Subdivision.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Subdivision.first
    assert_template 'edit'
  end

  def test_update_valid
    Subdivision.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Subdivision.first
    assert_redirected_to subdivision_url(assigns(:subdivision))
  end

  def test_destroy
    subdivision = Subdivision.first
    delete :destroy, :id => subdivision
    assert_redirected_to subdivisions_url
    assert !Subdivision.exists?(subdivision.id)
  end
end
