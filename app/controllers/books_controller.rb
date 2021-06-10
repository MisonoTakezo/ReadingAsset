class BooksController < ApplicationController
  def search
    @keyword = search_params[:keyword]
    @books = Fetcher::GoogleBook::BookSearch.call(keyword: @keyword)
  end
  def show
    @post = Post.find_by(id: params[:id], status: :visible)
  end

  private
    def search_params
      params.permit(:keyword)
    end
end
