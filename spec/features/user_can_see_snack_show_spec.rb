require 'rails_helper'

describe 'When a user visits a snack show page' do

  scenario 'they see the name and price of each snack at that location' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    mikes  = owner.machines.create(location: "Mike's Bar")
    sams  = owner.machines.create(location: "Sam's Pub")
    chips = Snack.create(name: "chips", price: 1.55, machines: [dons, mikes, sams])

    visit snack_path(chips)

    expect(page).to have_content(chips.name)
    expect(page).to have_content(chips.price)
    expect(page).to have_content(dons.location)
    expect(page).to have_content(mikes.location)
    expect(page).to have_content(sams.location)
save_and_open_page

  end
end


  # and I see a count of the different kinds of items in that vending machine.
