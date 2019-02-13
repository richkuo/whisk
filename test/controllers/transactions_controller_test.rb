require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaction = transactions(:one)
  end

  test "should get index" do
    get transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_transaction_url
    assert_response :success
  end

  test "should create transaction" do
    assert_difference('Transaction.count') do
      post transactions_url, params: { transaction: { amount: @transaction.amount, company_id: @transaction.company_id, company_name: @transaction.company_name, currency_id: @transaction.currency_id, from_address: @transaction.from_address, from_id: @transaction.from_id, notes: @transaction.notes, payroll_id: @transaction.payroll_id, settled_at: @transaction.settled_at, user_email: @transaction.user_email, user_id: @transaction.user_id } }
    end

    assert_redirected_to transaction_url(Transaction.last)
  end

  test "should show transaction" do
    get transaction_url(@transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_transaction_url(@transaction)
    assert_response :success
  end

  test "should update transaction" do
    patch transaction_url(@transaction), params: { transaction: { amount: @transaction.amount, company_id: @transaction.company_id, company_name: @transaction.company_name, currency_id: @transaction.currency_id, from_address: @transaction.from_address, from_id: @transaction.from_id, notes: @transaction.notes, payroll_id: @transaction.payroll_id, settled_at: @transaction.settled_at, user_email: @transaction.user_email, user_id: @transaction.user_id } }
    assert_redirected_to transaction_url(@transaction)
  end

  test "should destroy transaction" do
    assert_difference('Transaction.count', -1) do
      delete transaction_url(@transaction)
    end

    assert_redirected_to transactions_url
  end
end
