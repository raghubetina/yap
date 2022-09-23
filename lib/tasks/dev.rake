desc "Hydrate the database with sample data"
task sample_data: :environment do
  AdminUser.destroy_all
  Category.destroy_all
  Categorization.destroy_all
  Place.destroy_all
  Review.destroy_all
  User.destroy_all

  AdminUser.create(email: "admin@example.com", password: "password", password_confirmation: "password")

  category_hashes = [
    { :name => "Breakfast" },
    { :name => "American" },
    { :name => "Drink" },
    { :name => "Italian" },
    { :name => "Salad" },
    { :name => "French" },
    { :name => "Dessert" },
    { :name => "Classic" },
    { :name => "Japanese" },
    { :name => "Seafood" },
    { :name => "Indian" },
    { :name => "Bars" },
    { :name => "Cocktail Bars" },
  ]

  category_hashes.each do |category_hash|
    category = Category.new
    category.name = category_hash[:name]
    category.save
  end

  puts "There are now #{Category.count} categories in the database."

  place_hashes = [
    { :name => "The Bagelers Coffeehouse", :location => "2461 N Lincoln Ave, Chicago, IL 60614" },
    { :name => "Rangoli", :location => "2421 W North Ave, Chicago, IL 60647" },
    { :name => "Lockdown Bar & Grill", :location => "1024 N Western Ave, Chicago, IL 60622" },
    { :name => "Longman & Eagle", :location => "2657 N Kedzie Ave, Chicago, IL 60647" },
    { :name => "Ruth's Chris Steak House", :location => "431 N Dearborn St, Chicago, IL 60654" },
    { :name => "Little Goat", :location => "820 W Randolph St, Chicago, IL 60607" },
    { :name => "Chicago Cut Steakhouse", :location => "300 N Lasalle, Chicago, IL 60654" },
    { :name => "Billy Sunday", :location => "3143 W Logan Blvd, Chicago, IL 60647" },
    { :name => "Unite Urban Grill", :location => "1450 W Chicago Ave, Chicago, IL 60642" },
    { :name => "Balena", :location => "1633 N Halsted St, Chicago, IL 60614" },
    { :name => "Umami Burger", :location => "1480 N Milwaukee Ave, Chicago, IL 60622" },
    { :name => "Handlebar", :location => "2311 W North Ave, Chicago, IL 60647" },
    { :name => "The Whistler", :location => "2421 N Milwaukee Ave, Chicago, IL 60647" },
    { :name => "Skylark", :location => "2149 S Halsted St, Chicago, IL 60608" },
    { :name => "Shake Shack", :location => "66 E Ohio Street, Chicago, IL 60611" },
    { :name => "Margie's Candies", :location => "1960 N Western Ave, Chicago, IL 60647" },
    { :name => "MAX's Wine Dive", :location => "1482 N. Milwaukee Ave, Chicago, IL 60622" },
    { :name => "Kanela Breakfast Club", :location => "1408 N Milwaukee Ave, Chicago, IL 60622" },
    { :name => "The Publican", :location => "837 W Fulton Market, Chicago, IL 60607" },
    { :name => "Mott St", :location => "1401 N Ashland Ave, Chicago, IL 60622" },
    { :name => "Pleasant House Bakery", :location => "964 W 31st St, Chicago, IL 60608" },
    { :name => "The Southern", :location => "1840 W North Ave, Chicago, IL 60622" },
    { :name => "Slurping Turtle", :location => "116 W Hubbard St, Chicago, IL 60654" },
    { :name => "Big Star", :location => "1531 N Damen, Chicago, IL 60622" },
    { :name => "Plein Air Cafe & Eatery", :location => "5751 S Woodlawn Ave, Chicago, IL 60637" },
    { :name => "Bavette's Bar & Boeuf", :location => "218 W Kinzie St, Chicago, IL 60654" },
    { :name => "Au Cheval", :location => "800 W Randolph St, Chicago, IL 60607" },
  ]

  place_hashes.each do |place_hash|
    place = Place.new
    place.name = place_hash[:name]
    place.location = place_hash[:location]
    place.save

    place.categories << Category.all.sample(rand(3))
  end

  puts "There are now #{Place.count} places in the database."

  usernames = ["alice", "bob", "carol", "doug", "ellen"]

  usernames.each do |username|
    user = User.new
    user.first_name = username.capitalize
    user.last_name = "Smith"
    user.email = "#{username}@example.com"
    user.password = "password"
    user.save
  end

  User.find_by(first_name: "Ellen").update(admin: true)

  puts "There are now #{User.count} users in the database."

  review_hashes = [
    { :user => "bob", :dish => "Michelada", :place => "Big Star", :notes => "" },
    { :user => "bob", :dish => "Gnocchi", :place => "MAX's Wine Dive", :notes => "Braised short rib" },
    { :user => "alice", :dish => "Fruit Bowl", :place => "Kanela Breakfast Club", :notes => "" },
    { :user => "bob", :dish => "Charcuterie", :place => "The Publican", :notes => "" },
    { :user => "bob", :dish => "Tres Leches", :place => "Mott St", :notes => "" },
    { :user => "alice", :dish => "Pot Pie", :place => "Pleasant House Bakery", :notes => "Mushroom, kale" },
    { :user => "alice", :dish => "Grits", :place => "The Southern", :notes => "" },
    { :user => "bob", :dish => "Ramen", :place => "Slurping Turtle", :notes => "" },
    { :user => "alice", :dish => "Banana Split", :place => "Margie's Candies", :notes => "" },
    { :user => "alice", :dish => "Veggie Burger", :place => "Shake Shack", :notes => "" },
    { :user => "bob", :dish => "Chili", :place => "Skylark", :notes => "" },
    { :user => "alice", :dish => "Old Fashioned", :place => "The Whistler", :notes => "" },
    { :user => "alice", :dish => "Fried Pickles", :place => "Handlebar", :notes => "" },
    { :user => "alice", :dish => "Bloody Mary", :place => "Handlebar", :notes => "" },
    { :user => "carol", :dish => "Burger", :place => "Umami Burger", :notes => "" },
    { :user => "bob", :dish => "Spaghetti", :place => "Balena", :notes => "Sea urchin" },
    { :user => "alice", :dish => "Watermelon Salad", :place => "Unite Urban Grill", :notes => "" },
    { :user => "bob", :dish => "Negroni", :place => "Billy Sunday", :notes => "" },
    { :user => "carol", :dish => "Lamb Chops", :place => "Chicago Cut Steakhouse", :notes => "" },
    { :user => "carol", :dish => "Creme Brulee", :place => "Ruth's Chris Steak House", :notes => "" },
    { :user => "carol", :dish => "Pancakes", :place => "Little Goat", :notes => "Sourdough" },
    { :user => "alice", :dish => "Gin and Tonic", :place => "Longman & Eagle", :notes => "" },
    { :user => "alice", :dish => "Mussels", :place => "Lockdown Bar & Grill", :notes => "Coconut curry sauce" },
    { :user => "bob", :dish => "Mussels", :place => "Lockdown Bar & Grill", :notes => "Coconut curry sauce" },
    { :user => "ellen", :dish => "Mussels", :place => "Lockdown Bar & Grill", :notes => "Coconut curry sauce" },
    { :user => "ellen", :dish => "Chicken Tikka Masala", :place => "Rangoli", :notes => "" },
    { :user => "ellen", :dish => "Michelada", :place => "Big Star", :notes => "" },
    { :user => "alice", :dish => "Michelada", :place => "Big Star", :notes => "" },
    { :user => "ellen", :dish => "Pot Pie", :place => "Plein Air Cafe & Eatery", :notes => "" },
    { :user => "ellen", :dish => "Old Fashioned", :place => "Bavette's Bar & Boeuf", :notes => "" },
    { :user => "ellen", :dish => "Burger", :place => "Au Cheval", :notes => "Bacon, fried egg" },
    { :user => "ellen", :dish => "Biscuits and Gravy", :place => "Little Goat", :notes => "" },
  ]

  review_hashes.each do |review_hash|
    user = User.find_by({ :first_name => review_hash[:user].capitalize })
    place = Place.find_by({ :name => review_hash[:place] })
    review = Review.new
    review.place_id = place.id
    review.reviewer_id = user.id
    rating = rand(1..5)
    review.rating = rating
    dish = review_hash[:dish]
    if rating > 3
      body = "The #{dish} was great!"
    elsif rating == 3
      body = "Meh"
    else
      body = "The service was terrible."
    end
    review.body = body
    review.save
  end

  puts "There are now #{Review.count} reviews in the database."
end
