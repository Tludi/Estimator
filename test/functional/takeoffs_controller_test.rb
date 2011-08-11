require 'test_helper'

class TakeoffsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Takeoff.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Takeoff.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Takeoff.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to takeoff_url(assigns(:takeoff))
  end

  def test_edit
    get :edit, :id => Takeoff.first
    assert_template 'edit'
  end

  def test_update_invalid
    Takeoff.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Takeoff.first
    assert_template 'edit'
  end

  def test_update_valid
    Takeoff.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Takeoff.first
    assert_redirected_to takeoff_url(assigns(:takeoff))
  end

  def test_destroy
    takeoff = Takeoff.first
    delete :destroy, :id => takeoff
    assert_redirected_to takeoffs_url
    assert !Takeoff.exists?(takeoff.id)
  end
end
