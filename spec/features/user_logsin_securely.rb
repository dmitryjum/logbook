require 'spec_helper'

feature "a user can login securely" do
    let!(:creator) { FactoryGirl.create(:user) }
    let!(:some_other_user) { FactoryGirl.create(:user) }

    let!(:jumpone) { FactoryGirl.create(:jump, user: creator) }
    it "can login and see his jumps in the list" do
      visit root_path
      expect(page).to have_content "Email"

      login(creator)
      expect(page).to have_content "Log Out #{creator.first_name}!"
      within ".my_jumps" do
        expect(page).to have_content jumpone.jump_number
      end

      logout(creator)
      login(some_other_user)
      expect(page).to have_content "Log Out #{some_other_user.first_name}!"
      expect(page).to_not have_content "Log Out #{creator.first_name}!"
      within ".my_jumps" do
        expect(page).to_not have_content jumpone.jump_number
      end
    end


  def login(user)
    visit("/")
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in!"
  end

  def logout(user)
    click_link "Log Out #{user.first_name}!"
  end
end