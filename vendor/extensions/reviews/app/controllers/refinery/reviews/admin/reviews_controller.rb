module Refinery
  module Reviews
    module Admin
      class ReviewsController < ::Refinery::AdminController

        crudify :'refinery/reviews/review',
                :title_attribute => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def review_params
          params.require(:review).permit(:name, :user_name, :reviewed_on, :photo_id, :description)
        end
      end
    end
  end
end
