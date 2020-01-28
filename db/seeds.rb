require_relative '../lib/event.rb'
require_relative '../lib/attendance.rb'
require_relative '../lib/user.rb'


Event.destroy_all
e1 = Event.create(name_of_event: "Ground-Hog Day")
e2 = Event.create(name_of_event: "Ferragosto")
e3 = Event.create(name_of_event: "BillyBob Day")

User.destroy_all
u1 = User.create(name: "John")
u2 = User.create(name: "Amy")
u3 = User.create(name: "Jimmy")
u4 = User.create(name: "Tammy")

Attendance.destroy_all
a1 = Attendance.create(user_id:u1.id, event_id: e1.id)
a2 = Attendance.create(user_id:u2.id, event_id: e1.id)
a3 = Attendance.create(user_id:u3.id, event_id: e3.id)
a4 = Attendance.create(user_id:u4.id, event_id: e2.id)


