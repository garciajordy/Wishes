require 'rails_helper'

RSpec.describe 'Make a group', type: :system do
  before do
    driven_by(:rack_test)
    User.create(name: "garcia")
    @user = User.create(name: "polina")
    Group.create(name: "Codecademy",user_id:1, icon:"")
    Wishlist.create(name: "Ruby",amount: 350,author_id:1,group_id:1)
  end


  it 'Log in with username that hasn\'t been created' do
    visit root_path
    click_link 'Log in'
    fill_in "name" , with: "jordy"
    click_button 'Log in'
    
    expect(page).to have_text("Invalid Username")
  end

  it 'create group' do
    visit root_path
    click_link 'Sign up'
    fill_in "username" , with: "jordy"
    click_button 'next'
    click_link "All groups"
    click_button "Create"
    fill_in "groupname", with: "Microverse"
    click_button "Create"
    
    expect(page).to have_text("Microverse")
  end

 it 'Create Wish' do
   visit root_path
   click_link 'Sign up'
   fill_in "username" , with: "jordy"
   click_button 'next'
   click_link "All groups"
   click_button "Create"
   fill_in "groupname", with: "Microverse"
   click_button "Create"
   click_link "Microverse"
   click_button "Add Wish"
   fill_in "wishname", with: "Ruby on rails"
   fill_in "wishamount", with: "450"
   click_button "Create"
   expect(page).to have_text("Ruby on rails")
 end

    it 'Pay for wish' do
    visit root_path
   click_link 'Log in'
   fill_in "name" , with: "garcia"
   click_button 'Log in'
   click_link "All groups"
   click_button "Create"
   fill_in "groupname", with: "Microverse"
   click_button "Create"
   click_link "Microverse"
   click_button "Add Wish"
   fill_in "wishname", with: "Ruby on rails"
   fill_in "wishamount", with: "450"
   click_button "Create"
       visit root_path
       click_link 'Log in'
       fill_in "name" , with: "polina"
       click_button 'Log in'
       click_link "All groups"
       click_link "Microverse"
       click_link "Pay wish"
       expect(page).to have_text("Paid by #{@user.name}")
     end
end