class BooksController < ApplicationController
  def search
    @query = search_params[:q]
    @books = Fetcher::GoogleBook::BookSearch.call(q: @query)
  end

  private
    def search_params
      params.permit(:q)
    end
end
