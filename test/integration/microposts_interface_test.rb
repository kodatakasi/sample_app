require 'test_helper'

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "micropost interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # 無効な送信
    post microposts_path, params: { micropost: { content: "" } }
    # 有効な送信
    # content = "This micropost really ties the room together"
    # picture = fixture_file_upload('test/fixtures/rails.png', 'image/png')
    # assert_difference 'Micropost.count', 1 do
    #   post microposts_path, params: { micropost:
    #                                   { content: content,
    #                                     picture: FILL_IN } }
    # end
    # assert FILL_IN.picture?
    # follow_redirect!
    # assert_match content, response.body
    # 投稿を削除する
    # assert_select 'a', 'delete'
    # first_micropost = @user.microposts.paginate(page: 1).first
    # assert_difference 'Micropost.count', -1 do
    #   delete micropost_path(first_micropost)
    # end
    # 違うユーザーのプロフィールにアクセスする
    get user_path(users(:archer))
    assert_select 'a', { text: 'delete', count: 0 }
  end
  
end