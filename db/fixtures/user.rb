admin_role = Role.find(:first, :conditions => "name = 'Administrator'")
student_role = Role.find(:first, :conditions => "name = 'Student'")
supervisor_role = Role.find(:first, :conditions => "name = 'Supervisor'")

user = User.seed do |s|
  s.id    = 1
  s.username = "etud1000"
  s.email = "etud1000@usherbrooke.ca"
  s.encrypted_password  = "$2a$10$JD1FE..pvhBDV2S5ZyMfIOp1w8t.wDSe8GAVNS1GZ9ySv.WKOzbU2"
end
User.find(1).roles << student_role

User.seed do |s|
  s.id    = 2
  s.username = "etud2000"
  s.email = "etud2000@usherbrooke.ca"
  s.encrypted_password  = "$2a$10$JD1FE..pvhBDV2S5ZyMfIOp1w8t.wDSe8GAVNS1GZ9ySv.WKOzbU2"
end
User.find(2).roles << student_role

User.seed do |s|
  s.id    = 3
  s.username = "etud3000"
  s.email = "etud3000@usherbrooke.ca"
  s.encrypted_password  = "$2a$10$JD1FE..pvhBDV2S5ZyMfIOp1w8t.wDSe8GAVNS1GZ9ySv.WKOzbU2"
end
User.find(3).roles << student_role

User.seed do |s|
  s.id    = 4
  s.username = "etud4000"
  s.email = "etud4000@usherbrooke.ca"
  s.encrypted_password  = "$2a$10$JD1FE..pvhBDV2S5ZyMfIOp1w8t.wDSe8GAVNS1GZ9ySv.WKOzbU2"
end
User.find(4).roles << student_role

User.seed do |s|
  s.id    = 5
  s.username = "etud5000"
  s.email = "etud5000@usherbrooke.ca"
  s.encrypted_password  = "$2a$10$JD1FE..pvhBDV2S5ZyMfIOp1w8t.wDSe8GAVNS1GZ9ySv.WKOzbU2"
end
User.find(5).roles << student_role

User.seed do |s|
  s.id    = 6
  s.username = "etud6000"
  s.email = "etud6000@usherbrooke.ca"
  s.encrypted_password  = "$2a$10$JD1FE..pvhBDV2S5ZyMfIOp1w8t.wDSe8GAVNS1GZ9ySv.WKOzbU2"
end
User.find(6).roles << student_role

User.seed do |s|
  s.id    = 7
  s.username = "etud7000"
  s.email = "etud7000@usherbrooke.ca"
  s.encrypted_password  = "$2a$10$JD1FE..pvhBDV2S5ZyMfIOp1w8t.wDSe8GAVNS1GZ9ySv.WKOzbU2"
end
User.find(7).roles << student_role

User.seed do |s|
  s.id    = 8
  s.username = "etud8000"
  s.email = "etud8000@usherbrooke.ca"
  s.encrypted_password  = "$2a$10$JD1FE..pvhBDV2S5ZyMfIOp1w8t.wDSe8GAVNS1GZ9ySv.WKOzbU2"
end
User.find(8).roles << student_role

User.seed do |s|
  s.id    = 9
  s.username = "supe1000"
  s.email = "supe1000@usherbrooke.ca"
  s.encrypted_password  = "$2a$10$JD1FE..pvhBDV2S5ZyMfIOp1w8t.wDSe8GAVNS1GZ9ySv.WKOzbU2"
end
User.find(9).roles << supervisor_role

User.seed do |s|
  s.id    = 10
  s.username = "supe2000"
  s.email = "supe2000@usherbrooke.ca"
  s.encrypted_password  = "$2a$10$JD1FE..pvhBDV2S5ZyMfIOp1w8t.wDSe8GAVNS1GZ9ySv.WKOzbU2"
end
User.find(10).roles << supervisor_role

User.seed do |s|
  s.id    = 11
  s.username = "admi1000"
  s.email = "admi1000@usherbrooke.ca"
  s.encrypted_password  = "$2a$10$JD1FE..pvhBDV2S5ZyMfIOp1w8t.wDSe8GAVNS1GZ9ySv.WKOzbU2"
end
User.find(11).roles << admin_role