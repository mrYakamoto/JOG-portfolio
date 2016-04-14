admin = User.new(username: "admin")
admin.password = "password"
admin.save!
puts "==========Create-Admin=========="