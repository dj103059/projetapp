namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Admin",
                 email: "admin@exemple.fr",
                 password: "foobar",
                 password_confirmation: "foobar")
  end
end
