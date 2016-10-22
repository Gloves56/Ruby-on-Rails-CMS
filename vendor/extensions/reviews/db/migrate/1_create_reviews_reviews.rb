class CreateReviewsReviews < ActiveRecord::Migration

  def up
    create_table :refinery_reviews do |t|
      t.string :name
      t.string :user_name
      t.date :reviewed_on
      t.integer :photo_id
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-reviews"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/reviews/reviews"})
    end

    drop_table :refinery_reviews

  end

end
