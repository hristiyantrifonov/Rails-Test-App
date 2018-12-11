require 'test_helper'

class CreateCategoriesTest <ActionDispatch::IntegrationTest

  # We are emulating user's behavior here
  test "get new category form and create category" do

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


end