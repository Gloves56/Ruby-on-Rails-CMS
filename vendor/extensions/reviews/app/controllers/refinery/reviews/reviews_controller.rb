module Refinery
  module Reviews
    class ReviewsController < ::ApplicationController

      before_action :find_all_reviews
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @review in the line below:
        present(@page)
      end

      def show
        @review = Review.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @review in the line below:
        present(@page)
      end

    protected

      def find_all_reviews
        @reviews = Review.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/reviews").first
      end

    end
  end
end
