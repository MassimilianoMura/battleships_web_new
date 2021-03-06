require 'spec_helper'

feature 'ending game' do

  skip 'if there is a winner the game announces it' do
    visit '/start'
    fill_in 'name', with: 'Kirsten'
    click_button('Submit')
    click_button('Place ships')

    visit '/battle'
    select 'J', from: 'x_coord'
    select 10, from: 'y_coord'
    click_button('Fire!')

    allow($game).to receive(:has_winner?).and_return(true)
    expect(page).to have_content "GAME OVER!"

  end

end
