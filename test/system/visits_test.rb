require "application_system_test_case"

class VisitsTest < ApplicationSystemTestCase
  setup do
    @visit = visits(:one)
  end

  test "visiting the index" do
    visit visits_url
    assert_selector "h1", text: "Visits"
  end

  test "should create visit" do
    visit visits_url
    click_on "New visit"

    fill_in "Begining", with: @visit.begining
    fill_in "Doctor", with: @visit.doctor
    fill_in "Ending", with: @visit.ending
    fill_in "Patient", with: @visit.patient
    fill_in "Topic", with: @visit.topic
    click_on "Create Visit"

    assert_text "Visit was successfully created"
    click_on "Back"
  end

  test "should update Visit" do
    visit visit_url(@visit)
    click_on "Edit this visit", match: :first

    fill_in "Begining", with: @visit.begining
    fill_in "Doctor", with: @visit.doctor
    fill_in "Ending", with: @visit.ending
    fill_in "Patient", with: @visit.patient
    fill_in "Topic", with: @visit.topic
    click_on "Update Visit"

    assert_text "Visit was successfully updated"
    click_on "Back"
  end

  test "should destroy Visit" do
    visit visit_url(@visit)
    click_on "Destroy this visit", match: :first

    assert_text "Visit was successfully destroyed"
  end
end
