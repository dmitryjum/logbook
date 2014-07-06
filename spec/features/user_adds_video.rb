require 'spec_helper'

feature "user can add video" do
  let!(:creator) { FactoryGirl.create(:user) }
  let!(:jumpone) { FactoryGirl.create(:jump) }
  let!(:jumpvid) { FactoryGirl.create(:video) }

  it "logs in and creates a video" do
    visit root_path
    login(creator)
    within ".user-controls" do
      click_link "Add new jump"
    end
    
    add_jump(jumpone)
    within ".my_jumps" do
      click_link jumpone.jump_number
    end

    within ".options" do
      click_link "Here you can add a video from this jump"
    end

    add_vid(jumpvid)
    expect(page).to have_content jumpvid.name
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

  def add_vid(video)
    fill_in :video_name, with: video.name
    fill_in :video_video_url, with: video.video_url
    click_button "Create Video"
  end
end