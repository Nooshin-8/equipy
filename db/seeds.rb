# Create 3 users
# Each user has 4 equipments
User.destroy_all
Equipment.destroy_all

emails = ["nawel@email.com", "patrick@email.com", "nooshin@email.com", "tatiana@email.com"]

emails.each do |email|
  user = User.create!(email: email, password: 123456 )
  
  4.times do
    Equipment.create!(user: user, title: ["Basket ball", "Great surf board", "Snow shoes"].sample, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", category: %w[basketball football surf ski].sample, price: [145, 165, 25, 33].sample, location: ["5129 rue Saint-Denis, Montréal", "6290 rue Saint Denis, Montréal", "4825 rue Saint-André, Montréal"].sample)
  end
end