require "application_system_test_case"

class WaitlistsTest < ApplicationSystemTestCase
  setup do
    @waitlist = waitlists(:one)
  end

  test "visiting the index" do
    visit waitlists_url
    assert_selector "h1", text: "Waitlists"
  end

  test "creating a Waitlist" do
    visit waitlists_url
    click_on "New Waitlist"

    fill_in "No of seats", with: @waitlist.no_of_seats
    click_on "Create Waitlist"

    assert_text "Waitlist was successfully created"
    click_on "Back"
  end

  test "updating a Waitlist" do
    visit waitlists_url
    click_on "Edit", match: :first

    fill_in "No of seats", with: @waitlist.no_of_seats
    click_on "Update Waitlist"

    assert_text "Waitlist was successfully updated"
    click_on "Back"
  end

  test "destroying a Waitlist" do
    visit waitlists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Waitlist was successfully destroyed"
  end
end
