RSpec.shared_examples "average_ratings" do |which|
  describe "Ratings" do
    describe "overall_average" do
      it "averages the total ratings" do
        [0,1,1,2,3].each do |score|
          create(:tenancy, :with_rating, which => subject, overall: score)
        end

        expect(subject.ratings.overall_average).to eq(7/5.0)
      end
    end

    describe "repairs_average" do
      it "averages the total ratings" do
        [0,1,1,2,3].each do |score|
          create(:tenancy, :with_rating, which => subject, repairs: score)
        end

        expect(subject.ratings.repairs_average).to eq(7/5.0)
      end

      it "calculates correctly even with missing ratings" do
        [0,nil,nil,2,3].each do |score|
          create(:tenancy, :with_rating, which => subject, repairs: score)
        end

        expect(subject.ratings.repairs_average.round(3)).to eq((5/3.0).round(3))
      end

      it "returns nil when all the ratings are nil" do
        [nil,nil,nil,nil,nil].each do |score|
          create(:tenancy, :with_rating, which => subject, repairs: score)
        end

        expect(subject.ratings.repairs_average).to be_nil
      end
    end
  end
end