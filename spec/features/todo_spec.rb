require "spec_helper"

feature "user can add task to to-do list" do
  scenario "input task into new item field and submit, next page has item" do
    visit '/'
    fill_in 'new_task', with: 'new task tester'
    click_button 'Submit'
    expect(page).to have_content("new task tester")
  end

  scenario 'user naviates back to the home page after submitting an empty form' do
    # expect(page)to have_xpath
  end
end
