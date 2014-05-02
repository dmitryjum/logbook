require 'spec_helper'

describe "user can add a jump" do
  let!(:creator) { FactoryGirl.create(:user) }
  let!(:jumpone) { FactoryGirl.create(:jump) }

  it "can login and add a new jump" do
    visit root_path
    login(creator)
    within ".user-controls" do
      click_link "Add new jump"
    end

    add_jump(jumpone)
    within ".my_jumps" do
      expect(page).to have_content jumpone.jump_number
    end
  end

  def login(user)
    visit("/")
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in!"
  end

  def add_jump(jump)
    fill_in :jump_jump_number, with: jump.jump_number
    fill_in :jump_date, with: jump.date
    fill_in :jump_location, with: jump.location
    fill_in :jump_freefall_time, with: jump.freefall_time
    fill_in :jump_equipment, with: jump.equipment
    fill_in :jump_aircraft, with: jump.aircraft
    fill_in :jump_total_freefall_time, with: jump.total_freefall_time
    fill_in :jump_notes, with: jump.notes
    fill_in :jump_exit_altitude, with: jump.exit_altitude
    click_button "Create Jump"
  end
end