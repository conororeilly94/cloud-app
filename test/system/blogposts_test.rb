require "application_system_test_case"

class BlogpostsTest < ApplicationSystemTestCase
  setup do
    @blogpost = blogposts(:one)
  end

  test "visiting the index" do
    visit blogposts_url
    assert_selector "h1", text: "Blogposts"
  end

  test "creating a Blogpost" do
    visit blogposts_url
    click_on "New Blogpost"

    check "Active" if @blogpost.active
    fill_in "Body", with: @blogpost.body
    fill_in "Image", with: @blogpost.image
    fill_in "Summary", with: @blogpost.summary
    fill_in "Title", with: @blogpost.title
    fill_in "Url", with: @blogpost.url
    click_on "Create Blogpost"

    assert_text "Blogpost was successfully created"
    click_on "Back"
  end

  test "updating a Blogpost" do
    visit blogposts_url
    click_on "Edit", match: :first

    check "Active" if @blogpost.active
    fill_in "Body", with: @blogpost.body
    fill_in "Image", with: @blogpost.image
    fill_in "Summary", with: @blogpost.summary
    fill_in "Title", with: @blogpost.title
    fill_in "Url", with: @blogpost.url
    click_on "Update Blogpost"

    assert_text "Blogpost was successfully updated"
    click_on "Back"
  end

  test "destroying a Blogpost" do
    visit blogposts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Blogpost was successfully destroyed"
  end
end
