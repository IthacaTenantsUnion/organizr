class RawReviewsController < ApplicationController
  # GET /raw_reviews/new
  def new
    @raw_review = RawReview.new
  end

  # POST /raw_reviews or /raw_reviews.json
  def create
    @raw_review = RawReview.new(raw_review_params)
    @raw_review.submitter_ip_address = request.remote_ip
    
    respond_to do |format|
      if @raw_review.save
        format.html { redirect_to root_path, notice: "Thank you for submitting your review." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raw_review
      @raw_review = RawReview.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def raw_review_params
      params.require(:raw_review).permit(:landlord_public_review, :landlord_private_review, :landlord_general_rating, :landlord_repairs_rating, :security_deposit, :lease_end_date, :landlord_name, :property_manager, :preferred_contact, :rent)
    end
end
