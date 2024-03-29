admin_role = Role.find(:first, :conditions => "name = 'Administrator'")
student_role = Role.find(:first, :conditions => "name = 'Student'")
supervisor_role = Role.find(:first, :conditions => "name = 'Supervisor'")

user = User.seed do |s|
  s.id    = 1
  s.username = "etud1000"
  s.email = "etud1000@usherbrooke.ca"
  s.encrypted_password  = "$2a$10$mW7Q0R5zg74KVvM1eHsTO.nW/BGS5I79SCwlm0qMmcbHYGpA5XSGC"
  s.matricule = 10001000
  s.fullname = "Mickey, Mouse"
end
User.find(1).roles << student_role

User.seed do |s|
  s.id    = 2
  s.username = "etud2000"
  s.email = "etud2000@usherbrooke.ca"
  s.encrypted_password  = "$2a$10$mW7Q0R5zg74KVvM1eHsTO.nW/BGS5I79SCwlm0qMmcbHYGpA5XSGC"
  s.matricule = 20002000
  s.fullname = "Minnie, Mouse"
end
User.find(2).roles << student_role

User.seed do |s|
  s.id    = 3
  s.username = "etud3000"
  s.email = "etud3000@usherbrooke.ca"
  s.encrypted_password  = "$2a$10$mW7Q0R5zg74KVvM1eHsTO.nW/BGS5I79SCwlm0qMmcbHYGpA5XSGC"
  s.matricule = 30003000
  s.fullname = "Donald, Duck"
end
User.find(3).roles << student_role

User.seed do |s|
  s.id    = 4
  s.username = "etud4000"
  s.email = "etud4000@usherbrooke.ca"
  s.encrypted_password  = "$2a$10$mW7Q0R5zg74KVvM1eHsTO.nW/BGS5I79SCwlm0qMmcbHYGpA5XSGC"
  s.matricule = 40004000
  s.fullname = "Goofy, Gouf"
end
User.find(4).roles << student_role

User.seed do |s|
  s.id    = 5
  s.username = "etud5000"
  s.email = "etud5000@usherbrooke.ca"
  s.encrypted_password  = "$2a$10$mW7Q0R5zg74KVvM1eHsTO.nW/BGS5I79SCwlm0qMmcbHYGpA5XSGC"
  s.matricule = 50005000
  s.fullname = "Pat, Hibulaire"
end
User.find(5).roles << student_role

User.seed do |s|
  s.id    = 6
  s.username = "etud6000"
  s.email = "etud6000@usherbrooke.ca"
  s.encrypted_password  = "$2a$10$mW7Q0R5zg74KVvM1eHsTO.nW/BGS5I79SCwlm0qMmcbHYGpA5XSGC"
  s.matricule = 60006000
  s.fullname = "Peter, Pan"
end
User.find(6).roles << student_role

User.seed do |s|
  s.id    = 7
  s.username = "etud7000"
  s.email = "etud7000@usherbrooke.ca"
  s.encrypted_password  = "$2a$10$mW7Q0R5zg74KVvM1eHsTO.nW/BGS5I79SCwlm0qMmcbHYGpA5XSGC"
  s.matricule = 70007000
  s.fullname = "Gripsou, Archibald"
end
User.find(7).roles << student_role

User.seed do |s|
  s.id    = 8
  s.username = "etud8000"
  s.email = "etud8000@usherbrooke.ca"
  s.encrypted_password  = "$2a$10$mW7Q0R5zg74KVvM1eHsTO.nW/BGS5I79SCwlm0qMmcbHYGpA5XSGC"
  s.matricule = 80008000
  s.fullname = "La fée, Clochette"
end
User.find(8).roles << student_role

User.seed do |s|
  s.id    = 9
  s.username = "supe1000"
  s.email = "supe1000@usherbrooke.ca"
  s.encrypted_password  = "$2a$10$mW7Q0R5zg74KVvM1eHsTO.nW/BGS5I79SCwlm0qMmcbHYGpA5XSGC"
  s.matricule = 11111111
  s.fullname = "Jiminy, Cricket"
end
User.find(9).roles << supervisor_role

User.seed do |s|
  s.id    = 10
  s.username = "admi1000"
  s.email = "admi1000@usherbrooke.ca"
  s.encrypted_password  = "$2a$10$mW7Q0R5zg74KVvM1eHsTO.nW/BGS5I79SCwlm0qMmcbHYGpA5XSGC"
  s.matricule = 99999999
  s.fullname = "Merlin, L'enchanteur"
end
User.find(10).roles << admin_role