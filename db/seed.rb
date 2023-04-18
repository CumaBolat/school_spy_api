
puts "Seeding..."

teacher1 = Teacher.create!(name: "Dylan", 
            									surname: "Henderson", 
															email: "example@mail.com", 
															phone_number: "123456789", 
															password_digest: "password", 
															age: 25,
															description: "I am a teacher")

teacher2 = Teacher.create!(name: "John", 
															surname: "Smith", 
															email: "john@mail.com", 
															phone_number: "123456789", 
															password_digest: "password", 
															age: 25, 
															description: "I am a teacher")

puts "Seeding done"
