require 'test_helper'

class WalltypesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Walltype.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Walltype.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Walltype.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to walltype_url(assigns(:walltype))
  end

  def test_edit
    get :edit, :id => Walltype.first
    assert_template 'edit'
  end

  def test_update_invalid
    Walltype.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Walltype.first
    assert_template 'edit'
  end

  def test_update_valid
    Walltype.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Walltype.first
    assert_redirected_to walltype_url(assigns(:walltype))
  end

  def test_destroy
    walltype = Walltype.first
    delete :destroy, :id => walltype
    assert_redirected_to walltypes_url
    assert !Walltype.exists?(walltype.id)
  end
end
