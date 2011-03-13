require 'test_helper'

class ActorsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Actor.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Actor.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Actor.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to actor_url(assigns(:actor))
  end

  def test_edit
    get :edit, :id => Actor.first
    assert_template 'edit'
  end

  def test_update_invalid
    Actor.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Actor.first
    assert_template 'edit'
  end

  def test_update_valid
    Actor.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Actor.first
    assert_redirected_to actor_url(assigns(:actor))
  end

  def test_destroy
    actor = Actor.first
    delete :destroy, :id => actor
    assert_redirected_to actors_url
    assert !Actor.exists?(actor.id)
  end
end
