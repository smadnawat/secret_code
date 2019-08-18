# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.skip_callback(:create, :after, :update_code)
User.skip_callback(:create, :after, :update_role)
user = User.find_or_initialize_by(firstname: "admin", lastname: "user", email: "admin@example.com")
user.password = "password"
user.save(validate: false)
Role.find_or_create_by(user_id: user.id, type_of: "admin")