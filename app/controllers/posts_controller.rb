# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :current_user
  before_action :set_post, only: %i[edit update destroy]
  before_action :current_creator?, only: %i[edit update destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(create_post_params)
    if @post.save
      flash[:success] = "投稿しました。"
      redirect_to @post
    else
      flash[:error] = "投稿できませんでした。"
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit; end

  def update
    if @post.update(update_post_params)
      flash[:success] = "更新しました。"
      redirect_to @post
    else
      flash[:error] = "更新できませんでした。"
      render :edit
    end
  end

  def destroy
    if @post.update!(status: :deleted)
      flash[:success] = "投稿を削除しました。"
      redirect_to user_path(@current_user)
    else
      flash[:error] = "投稿の削除に失敗しました。"
    end
  end

  private

    def create_post_params
      params.require(:post).permit(:user_id, :title, :impression)
    end

    def update_post_params
      params.require(:post).permit(:title, :impression)
    end

    def set_post
      @post = Post.find_by(id: params[:id], status: :visible)
      unless @post
        flash[:error] = "この投稿は存在しません"
        redirect_to user_path(@current_user) and return
      end
    end

    def current_creator?
      unless @current_user == @post.user
        flash[:error] = "このページを表示できません"
        redirect_to post_path(@post)
      end
    end
end
