require 'rails_helper'

RSpec.describe ReviewsHelper, type: :helper do
  before(:all) do
    @star_bad = "<span class='glyphicon glyphicon-star' aria-hidden='true' style='color:black' ></span>"
    @star_good = "<span class='glyphicon glyphicon-star' aria-hidden='true' style='color:#EF651A' ></span>"
  end
  it "display_ratings correctly with 0" do
    restaurant = create(:restaurant)
    user = create(:user)
    6.times do
      create(:review,item_id:Item.first.id,user_id:user.id,rating:0)
    end
    expect(ReviewsHelper.display_ratings(Item.first.reviews)).to eq(@star_bad*5)
  end
  it "display_ratings correctly with 1" do
    restaurant = create(:restaurant)
    user = create(:user)
    6.times do
      create(:review,item_id:Item.first.id,user_id:user.id,rating:1)
    end
    expect(ReviewsHelper.display_ratings(Item.first.reviews)).to eq(@star_good+@star_bad*4)
  end
  it "display_ratings correctly with 2" do
    restaurant = create(:restaurant)
    user = create(:user)
    6.times do
      create(:review,item_id:Item.first.id,user_id:user.id,rating:2)
    end
    expect(ReviewsHelper.display_ratings(Item.first.reviews)).to eq(@star_good*2+@star_bad*3)
  end
  it "display_ratings correctly with 3" do
    restaurant = create(:restaurant)
    user = create(:user)
    6.times do
      create(:review,item_id:Item.first.id,user_id:user.id,rating:3)
    end
    expect(ReviewsHelper.display_ratings(Item.first.reviews)).to eq(@star_good*3+@star_bad*2)
  end
  it "display_ratings correctly with 4" do
    restaurant = create(:restaurant)
    user = create(:user)
    6.times do
      create(:review,item_id:Item.first.id,user_id:user.id,rating:4)
    end
    expect(ReviewsHelper.display_ratings(Item.first.reviews)).to eq(@star_good*4+@star_bad)
  end
  it "display_ratings correctly with 5" do
    restaurant = create(:restaurant)
    user = create(:user)
    6.times do
      create(:review,item_id:Item.first.id,user_id:user.id,rating:5)
    end
    expect(ReviewsHelper.display_ratings(Item.first.reviews)).to eq(@star_good*5)
  end
  it "display_ratings correctly with -1" do
    restaurant = create(:restaurant)
    user = create(:user)
    6.times do
      create(:review,item_id:Item.first.id,user_id:user.id,rating:-1)
    end
    expect(ReviewsHelper.display_ratings(Item.first.reviews)).to eq(@star_bad*5)
  end
  it "display_ratings correctly with 6" do
    restaurant = create(:restaurant)
    user = create(:user)
    6.times do
      create(:review,item_id:Item.first.id,user_id:user.id,rating:6)
    end
    expect(ReviewsHelper.display_ratings(Item.first.reviews)).to eq(@star_bad*5)
  end
  it "display_ratings correctly no reviews" do
    restaurant = create(:restaurant)
    expect(ReviewsHelper.display_ratings(Item.first.reviews)).to eq(@star_bad*5)
  end

end
