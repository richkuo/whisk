require "application_system_test_case"

class TransactionsTest < ApplicationSystemTestCase
  setup do
    @transaction = transactions(:one)
  end

  test "visiting the index" do
    visit transactions_url
    assert_selector "h1", text: "Transactions"
  end

  test "creating a Transaction" do
    visit transactions_url
    click_on "New Transaction"

    fill_in "Amount", with: @transaction.amount
    fill_in "Company", with: @transaction.company_id
    fill_in "Company name", with: @transaction.company_name
    fill_in "Currency", with: @transaction.currency_id
    fill_in "From address", with: @transaction.from_address
    fill_in "From", with: @transaction.from_id
    fill_in "Notes", with: @transaction.notes
    fill_in "Payroll", with: @transaction.payroll_id
    fill_in "Settled at", with: @transaction.settled_at
    fill_in "User email", with: @transaction.user_email
    fill_in "User", with: @transaction.user_id
    click_on "Create Transaction"

    assert_text "Transaction was successfully created"
    click_on "Back"
  end

  test "updating a Transaction" do
    visit transactions_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @transaction.amount
    fill_in "Company", with: @transaction.company_id
    fill_in "Company name", with: @transaction.company_name
    fill_in "Currency", with: @transaction.currency_id
    fill_in "From address", with: @transaction.from_address
    fill_in "From", with: @transaction.from_id
    fill_in "Notes", with: @transaction.notes
    fill_in "Payroll", with: @transaction.payroll_id
    fill_in "Settled at", with: @transaction.settled_at
    fill_in "User email", with: @transaction.user_email
    fill_in "User", with: @transaction.user_id
    click_on "Update Transaction"

    assert_text "Transaction was successfully updated"
    click_on "Back"
  end

  test "destroying a Transaction" do
    visit transactions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Transaction was successfully destroyed"
  end
end
