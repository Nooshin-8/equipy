# Create 3 users
# Each user has 4 equipments
User.destroy_all
Equipment.destroy_all

emails = ["nawel@email.com", "patrick@email.com", "nooshin@email.com", "tatiana@email.com"]

emails.each do |email|
  user = User.create!(email: email, password: 123456 )
  
  # Use below if we want to seed with Cloudinary images. Just need to change the version and public_id to match the image's details

  # resource_type = "image"
  # type = "upload"
  # version = 1234567890
  # public_id = "wv7l1o6xwimtfvx2oxdw"
  # format = "jpg"
  # signature = Cloudinary::Utils.api_sign_request({:public_id=>public_id,
  # :version=>version}, Cloudinary.config.api_secret)
  # photo = "#{resource_type}/#{type}/v#{version}/#{public_id}.#{format}##{signature}"

  sufboard_photo = ["app/assets/images/assymetrical_surfboard.jpg", "app/assets/images/foam_surfboard.jpg"].sample
  footwear_photo = ["app/assets/images/men_hiking_boots.jpg", "app/assets/images/women_winter_boots.jpg"].sample
  skis_photo = "app/assets/images/skis.jpg"
  sports_balls_photo = "app/assets/images/used_basketball.jpg"
  random_pic = [sufboard_photo, footwear_photo, skis_photo, sports_balls_photo].sample

  4.times do
    equipment = Equipment.new(
      user: user,
      title: ["Basket ball", "Great surf board", "Snow shoes", "Skis"].sample,
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      category: %w[footwear skis sports footwear].sample,
      price: [145, 165, 25, 33].sample,
      location: ["5129 rue Saint-Denis, Montréal", "6290 rue Saint Denis, Montréal", "4825 rue Saint-André, Montréal", "1385 Jean Talon St E, Montreal, Quebec H2E 1S6, Canada", "7070 Henri Julien Ave, Montreal, Quebec H2S 3S3, Canada", "1450 Graham Blvd, Mount Royal, Quebec H3P 3N6, Canada", "3175 Chemin de la Côte-Sainte-Catherine, Montréal, QC H3T 1C5, Canada", "Montreal, QC H2S 1Z3, Canada"].sample)
    case 
    when equipment.title == "Basket ball"
      equipment.photos.attach(io: File.open(sports_balls_photo), filename: 'picture.jpg')
    when equipment.title == "Great surf board"
      equipment.photos.attach(io: File.open(sufboard_photo), filename: 'picture.jpg') 
    when equipment.title == "Snow shoes"
      equipment.photos.attach(io: File.open(footwear_photo), filename: 'picture.jpg')
    else
      equipment.photos.attach(io: File.open(skis_photo), filename: 'picture.jpg')
    end
    equipment.save!
  end
end
