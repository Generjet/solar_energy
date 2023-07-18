defmodule Solar.BLogTest do
  use Solar.DataCase

  alias Solar.BLog

  describe "posts" do
    alias Solar.BLog.Post

    import Solar.BLogFixtures

    @invalid_attrs %{title: nil, body: nil, post_status: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert BLog.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert BLog.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{title: "some title", body: "some body", post_status: 42}

      assert {:ok, %Post{} = post} = BLog.create_post(valid_attrs)
      assert post.title == "some title"
      assert post.body == "some body"
      assert post.post_status == 42
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = BLog.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{title: "some updated title", body: "some updated body", post_status: 43}

      assert {:ok, %Post{} = post} = BLog.update_post(post, update_attrs)
      assert post.title == "some updated title"
      assert post.body == "some updated body"
      assert post.post_status == 43
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = BLog.update_post(post, @invalid_attrs)
      assert post == BLog.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = BLog.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> BLog.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = BLog.change_post(post)
    end
  end
end
