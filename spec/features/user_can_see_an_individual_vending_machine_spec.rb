require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")

  end
  scenario 'they see the name and price of each snack at that location' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    chips = dons.snacks.create(name: "chips", price: 1.50)
    cookies = dons.snacks.create(name: "cookies", price: 3.50)
    pretzels = dons.snacks.create(name: "pretzels", price: 2.50)

    visit machine_path(dons)

    expect(page).to have_content(chips.name)
    expect(page).to have_content(chips.price)

    expect(page).to have_content(cookies.name)
    expect(page).to have_content(cookies.price)

    expect(page).to have_content(pretzels.name)
    expect(page).to have_content(pretzels.price)

  end

  scenario 'they see the average price of all snacks at that location' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    chips = dons.snacks.create(name: "chips", price: 1.59)
    cookies = dons.snacks.create(name: "cookies", price: 3.55)
    pretzels = dons.snacks.create(name: "pretzels", price: 2.58)

    visit machine_path(dons)

    expect(page).to have_content(dons.average_snack_price)
  end
end
