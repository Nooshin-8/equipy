puts "Destroying old data..."

User.destroy_all
Equipment.destroy_all

emails = %w[nawel@email.com patrick@email.com nooshin@email.com tatiana@email.com JasonBigHands@email.com spud@email.com jadam@email.com brick@email.com trumane@email.com jst@email.com]

puts "Generating users..."
emails.each do |email|
  user = User.new(email: email, password: 123456 )
  user.username = user.email.match(/.+?(?=@)/).to_s
  user.save!
end
  

sufboard_photo = ["app/assets/images/assymetrical_surfboard.jpg", "app/assets/images/foam_surfboard.jpg"].sample
footwear_photo = ["app/assets/images/men_hiking_boots.jpg", "app/assets/images/women_winter_boots.jpg"].sample
skis_photo = "app/assets/images/skis.jpg"
basketball_photo = "app/assets/images/used_basketball.jpg"

# 'Hunting & Fishing'
# 'Netball, Basketball & Football'
# water_sports_photo = ["app/assets/images/assymetrical_surfboard.jpg", "app/assets/images/foam_surfboard.jpg"].sample
# winter_sports = ["app/assets/images/skis.jpg"].sample
# 'Others'
def seed 
  penny_farther_photo = "app/assets/images/penny_farther.jpg"
  puts "Seeding equipment..."
  15.times do
    choice = rand(1..9)
    case
    when choice <= 3
      biking_photo = ["app/assets/images/kid_bike_1.jpg", "app/assets/images/kid_bike.jpg", "app/assets/images/mountain_bike_1.jpg", "app/assets/images/mountain_bike_2.jpg", "app/assets/images/mountain_bike.jpg", "app/assets/images/road_bike_1.jpg", "app/assets/images/road_bike.jpg"].shuffle.sample
      equipment = Equipment.new(
        user: User.all.sample,
        title: ["Sturdy Bike", "Fast Bike", "Smaller Bike", "Great Bike!", "Regular Bike", "Old Bicycle", "Penny Farthing"].sample,
        description: "a",
        category: 'Biking',
        price: [145, 165, 25, 33, 10, 50, 37, 22, 93, 101, 64, 22, 37].sample,
        location: ["5129 rue Saint-Denis, Montreal", "6290 rue Saint Denis, Montreal", "4825 rue Saint-Andre, Montreal", "1385 Jean Talon St E, Montreal, Quebec H2E 1S6, Canada", "7070 Henri Julien Ave, Montreal, Quebec H2S 3S3, Canada", "1450 Graham Blvd, Mount Royal, Quebec H3P 3N6, Canada", "3175 Chemin de la Côte-Sainte-Catherine, Montréal, QC H3T 1C5, Canada", "Montreal, QC H2S 1Z3, Canada"].sample)
        equipment.description = ["This #{equipment.title.downcase} is one of the greatest possesions that I own. ANYONE would be lucky to rent this and enjoy it. It is available to be rented on weekends (excluding the week between Christmas and New Years). Please contact me!", "I love my #{equipment.title.downcase} and so will you! It's perfect for all weather and seasons. You couldn't ask for a better item to rent.", "CONTACT ME IF YOU WOULD LIKE TO RENT MY EQUIPMENT. I AM NOT INTERESTED IN CASH, **SWAPS ONLY**, BUT AM LISTING IT HERE FOR MORE EXPOSURE. AGAIN, I DO NOT WANT MONEY, ONLY SWAPS!!"].sample
        if equipment.title == "Penny Farthing"
          equipment.photos.attach(io: File.open(penny_farther_photo), filename: 'picture.jpg')
        else 
          equipment.photos.attach(io: File.open(biking_photo), filename: 'picture.jpg')
        end
        equipment.save!
    when choice <= 6
      golfball_photo = ["app/assets/images/golf.jpg", "app/assets/images/golf_1.jpg", "app/assets/images/golf_2.jpg", "app/assets/images/golf_3.jpg", "app/assets/images/golf_4.jpg", "app/assets/images/golf_5.jpg", "app/assets/images/golf_6.jpg"].shuffle.sample
      equipment = Equipment.new(
        user: User.all.sample,
        title: ["Golf Clubs", "Gr8 Clbus!", "Big Drivers", "My Lucky Clubs", "Old Clubs", "New Clubs", "Neighbor's Clubs"].sample,
        description: "a",
        category: 'Golf',
        price: [145, 165, 25, 33, 10, 50, 37, 22, 93, 101, 64, 22, 37].sample,
        location: ["5129 rue Saint-Denis, Montreal", "6290 rue Saint Denis, Montreal", "4825 rue Saint-Andre, Montreal", "1385 Jean Talon St E, Montreal, Quebec H2E 1S6, Canada", "7070 Henri Julien Ave, Montreal, Quebec H2S 3S3, Canada", "1450 Graham Blvd, Mount Royal, Quebec H3P 3N6, Canada", "3175 Chemin de la Côte-Sainte-Catherine, Montréal, QC H3T 1C5, Canada", "Montreal, QC H2S 1Z3, Canada"].sample)
        equipment.description = ["These #{equipment.title.downcase} are one of the greatest possesions that I own. ANYONE would be lucky to rent and enjoy them. They are available to be rented on weekends (excluding the week between Christmas and New Years). Please contact me!", "I love my #{equipment.title.downcase} and so will you! They're perfect for all weather and seasons. You couldn't ask for better items to rent.", "CONTACT ME IF YOU WOULD LIKE TO RENT MY EQUIPMENT. I AM NOT INTERESTED IN CASH, **SWAPS ONLY**. I AM ONLY LISTING THEM HERE FOR MORE EXPOSURE. AGAIN, I DO NOT WANT MONEY, ONLY SWAPS!!"].sample
        equipment.photos.attach(io: File.open(golfball_photo), filename: 'picture.jpg')
        equipment.save!
    else
      hiking_camping_photo = ["app/assets/images/men_hiking_boots.jpg", "app/assets/images/women_winter_boots.jpg", "app/assets/images/boots.jpg", "app/assets/images/boots_1.jpg", "app/assets/images/boots_2.jpg", "app/assets/images/boots_3.jpg", "app/assets/images/boots_4.jpg", "app/assets/images/boots_5.jpg", "app/assets/images/boots_6.jpg", "app/assets/images/boots_7.jpg"].shuffle.sample
      equipment = Equipment.new(
        user: User.all.sample,
        title: ["Great Boots!", "Old Boots", "Hiking Boots", "Mountain Boots", "Lucky Boots", "B+ Boots", "Boots!"].sample,
        description: "a",
        category: 'Hiking & Camping',
        price: [145, 165, 25, 33, 10, 50, 37, 22, 93, 101, 64, 22, 37].sample,
        location: ["5129 rue Saint-Denis, Montreal", "6290 rue Saint Denis, Montreal", "4825 rue Saint-Andre, Montreal", "1385 Jean Talon St E, Montreal, Quebec H2E 1S6, Canada", "7070 Henri Julien Ave, Montreal, Quebec H2S 3S3, Canada", "1450 Graham Blvd, Mount Royal, Quebec H3P 3N6, Canada", "3175 Chemin de la Côte-Sainte-Catherine, Montréal, QC H3T 1C5, Canada", "Montreal, QC H2S 1Z3, Canada"].sample)
        equipment.description = ["These #{equipment.title.downcase} are one of the greatest possesions that I own. ANYONE would be lucky to rent and enjoy them. They are available to be rented on weekends (excluding the week between Christmas and New Years). Please contact me!", "I love my #{equipment.title.downcase} and so will you! They're perfect for all weather and seasons. You couldn't ask for better items to rent.", "CONTACT ME IF YOU WOULD LIKE TO RENT MY EQUIPMENT. I AM NOT INTERESTED IN CASH, **SWAPS ONLY**. I AM ONLY LISTING THEM HERE FOR MORE EXPOSURE. AGAIN, I DO NOT WANT MONEY, ONLY SWAPS!!"].sample
        equipment.photos.attach(io: File.open(hiking_camping_photo), filename: 'picture.jpg')
        equipment.save!
    end
  end
end

seed
