require 'rails_helper'

feature "user registers" do
  scenario "allows individual to register for Blocipedia" do
    visit root_path
    click_on('Sign Up')
    fill_in 'Name', with: 'Joe Schmoe'
    fill_in 'Email', with: 'abc@example.com'
    fill_in 'Password', with: 'helloworld'
    fill_in 'Password Confirmation', with: 'helloworld'
    click_button('Sign Up')
    expect(page).to have_content 'A message with a confirmation'
    open_last_email_for('abc@example.com')
    click_first_link_in_email
    expect(page).to have_content 'Your email address has been successfully confirmed.'
    
    fill_in 'Email', with: 'abc@example.com'
    fill_in 'Password', with: 'helloworld'
    click_button('Log In')
    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_content 'Joe Schmoe' 

  end
end



  





  


