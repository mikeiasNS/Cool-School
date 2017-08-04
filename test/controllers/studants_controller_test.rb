require 'test_helper'

class StudantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @studant = studants(:one)
  end

  test "should get index" do
    get studants_url
    assert_response :success
  end

  test "should get new" do
    get new_studant_url
    assert_response :success
  end

  test "should create studant" do
    assert_difference('Studant.count') do
      post studants_url, params: { studant: { birthday: @studant.birthday, name: @studant.name, unit_id: @studant.unit_id } }
    end

    assert_redirected_to studant_url(Studant.last)
  end

  test "should show studant" do
    get studant_url(@studant)
    assert_response :success
  end

  test "should get edit" do
    get edit_studant_url(@studant)
    assert_response :success
  end

  test "should update studant" do
    patch studant_url(@studant), params: { studant: { birthday: @studant.birthday, name: @studant.name, unit_id: @studant.unit_id } }
    assert_redirected_to studant_url(@studant)
  end

  test "should destroy studant" do
    assert_difference('Studant.count', -1) do
      delete studant_url(@studant)
    end

    assert_redirected_to studants_url
  end
end
