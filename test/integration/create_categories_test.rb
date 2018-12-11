require 'test_helper'

class CreateCategoriesTest <ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)
  end

  # We are emulating user's behavior here
  test "get new category form and create category" do
    sign_in_as(@user, "password")
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do

      # This means: we post the params object to the page on path: categories_path
      post categories_path, params: { category: {name: "sports"} }
      follow_redirect!
    end

    # Specifying what we see after the request
    assert_template 'categories/index'
    assert_match "sports", response.body
  end

  test "invalid category submission results in failure" do
    sign_in_as(@user, "password")
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count'  do
      post categories_path, params: { category: {name: " "} }
    end

    # Specifying what we see after the request
    assert_template 'categories/new'

    # These check if we got the errors partial
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end



end