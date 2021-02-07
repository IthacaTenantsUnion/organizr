class SplitReviewsToTenancy < ActiveRecord::Migration[6.0]
  def change
    rename_column :tenancies, :review, :private_review
    add_column :tenancies, :public_review, :string
  end
end
