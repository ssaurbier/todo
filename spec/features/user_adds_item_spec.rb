# require 'rails_helper'
#
# feature 'user adds new item', %{
#   As an authenticated user
#   I want to add an item
#   So that so that people can use it
#
#   Acceptance Criteria:
#   - [x]  I must be logged in
#   - [x]  I must provide list, item, and date
#   - [x]  I must recieve an error message for invalid form
#   - [x]  I must get a success message and reload the page
# } do
#   let!(:user) { FactoryGirl.create(:user) }
#   let!(:list) { FactoryGirl.create(:list) }
#
#   scenario 'user successfully adds product' do
#     sign_in(user)
#     visit users_path
#     fill_in 'Item name', with: 'New item'
#     fill_in 'List', with: 'groceries'
#     click_button 'Create Product'
#     expect(page).to have_content('Product Successfully Added')
#     expect(page).to have_content("New item")
#   end
#
#   scenario 'user unsuccessfully adds a product' do
#     sign_in(user)
#     visit users_path
#     select brand.name, from: 'Brand'
#     select category.name, from: 'Category'
#     fill_in 'Description', with: 'This is a description of the product'
#     click_button 'Create Product'
#     expect(page).to have_content('Add a new product!')
#     expect(page).to have_content('Title can\'t be blank')
#   end
#
#   scenario 'user is not signed in' do
#     visit users_path
#     expect(page).to have_content('You need to sign in or
#       sign up before continuing.')
#   end
# end
