# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :login_required, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :must_be_post_owner, only: [:edit, :update, :destroy]

  def index
    @posts = Post.where(status: :visible).includes(book: :authors).order(id: :desc)
  end

  def new
    @book = Fetcher::GoogleBook::BookIdentify.call(google_books_api_id: new_post_params[:google_books_api_id])
    @post_form = PostForm.new
  end

  def create
    @post_form = PostForm.new(create_post_params)

    if @post_form.save
      flash[:success] = "投稿しました。"
      redirect_to @post_form.post
    else
      flash[:error] = "投稿に失敗しました。再度お試しください。"
      redirect_to new_post_path(google_books_api_id: create_post_params[:google_books_api_id])
    end
  end

  def show; end

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
      redirect_to mypage_user_path(@current_user)
    else
      flash[:error] = "投稿の削除に失敗しました。"
    end
  end

  private

    def create_post_params
      params.require(:post_form).permit(:user_id, :impression, :title, :image, :description, :published_at, :authors, :google_books_api_id)
    end

    def update_post_params
      params.require(:post).permit(:impression)
    end

    def new_post_params
      params.permit(:google_books_api_id)
    end

    def set_post
      @post = Post.includes(book: :authors).find_by(id: params[:id], status: :visible)
      unless @post
        flash[:error] = "この投稿は存在しません"
        redirect_to root_path and return
      end
    end

    def must_be_post_owner
      unless @current_user == @post.user
        flash[:error] = "このページを表示できません"
        redirect_to post_path(@post)
      end
    end
end
