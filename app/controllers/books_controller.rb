class BooksController < ApplicationController
  def search
    @query = search_params[:q]
    @books = Fetcher::GoogleBook::BookSearch.call(q: @query)
  end
  def show
    @post = Post.find_by(id: params[:id], status: :visible)
  end

  private
    def search_params
      params.permit(:q)
    end
end
