require 'spec_helper'

describe "a user can share a jump" do
   let!(:creator) { FactoryGirl.create(:user) }
   let!(:shared) { FactoryGirl.create(:user) }
   let!(:some_other_user) { FactoryGirl.create(:user) } 

   let!(:jumpone) { FactoryGirl.create(:jump, user: creator) }

   it "can only be seen by people who it is shared with" do
    login(creator)

    visit user_jumps_path(creator)
    click_link "23"

    within ".options" do
      click_link "Edit this jump"
    end
    select shared.email, from: "jump_shared_users"
    # save_and_open_page
    #binding.pry
    click_button "Update Jump"

    logout(creator)
    login(shared)

    visit user_jumps_path(shared)
    within ".shared_jumps" do
      expect(page).to have_content jumpone.jump_number
    end
    click_link jumpone.jump_number
    within ".greeting" do
      expect(page).to have_content jumpone.jump_number
    end

    logout(shared)
    login(some_other_user)

    visit user_jumps_path(some_other_user)
    within ".shared_jumps" do
      expect(page).to_not have_content jumpone.jump_number
    end
    visit user_jump_path(creator, jumpone)
    expect(page).to_not have_content jumpone.jump_number
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