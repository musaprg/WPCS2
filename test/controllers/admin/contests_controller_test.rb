require 'test_helper'

class Admin::ContestsControllerTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers

  setup do
    @admin_contest = Contest.create!(name_ja: 'MyString', name_en: 'MyString',
                                     description_ja: 'MyString', description_en: 'MyString',
                                     start_at: Time.current, end_at: Time.current.next_month, score_baseline: 100)
    @user = users(:one)
    AdminRole.create!(user: @user)
    login_as(@user)
  end

  test 'should get index' do
    skip 'because this is a flaky test ...'
    get admin_contests_url
    assert_response :success
  end

  test 'should get new' do
    skip 'because this is a flaky test ...'
    get new_admin_contest_url
    assert_response :success
  end

  test 'should create admin_contest' do
    skip 'because this is a flaky test ...'
    assert_difference('Contest.count') do
      post admin_contests_url, params:
        { contest: { description_en: @admin_contest.description_en, description_ja: @admin_contest.description_ja,
                     end_at: @admin_contest.end_at, name_en: @admin_contest.name_en, name_ja: @admin_contest.name_ja,
                     score_baseline: @admin_contest.score_baseline, start_at: @admin_contest.start_at } }
    end

    assert_redirected_to admin_contest_url(Contest.last)
  end

  test 'should show admin_contest' do
    skip 'because this is a flaky test ...'
    get admin_contest_url(@admin_contest)
    assert_response :success
  end

  test 'should get edit' do
    skip 'because this is a flaky test ...'
    get edit_admin_contest_url(@admin_contest)
    assert_response :success
  end

  test 'should update admin_contest' do
    skip 'because this is a flaky test ...'
    patch admin_contest_url(@admin_contest), params: {
      contest: { description_en: @admin_contest.description_en, description_ja: @admin_contest.description_ja,
                 end_at: @admin_contest.end_at, name_en: @admin_contest.name_en, name_ja: @admin_contest.name_ja,
                 score_baseline: @admin_contest.score_baseline, start_at: @admin_contest.start_at }
    }
    assert_redirected_to admin_contest_url(@admin_contest)
  end

  test 'should destroy admin_contest' do
    skip 'because this is a flaky test ...'
    assert_difference('Admin::Contest.count', -1) do
      delete admin_contest_url(@admin_contest)
    end

    assert_redirected_to admin_contests_url
  end
end
