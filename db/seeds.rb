Treatment.destroy_all
Appointment.destroy_all
Pet.destroy_all
Vet.destroy_all
Owner.destroy_all

v1 = Vet.create!(first_name: "Isidora", last_name: "Mercy", email: "mercy@vetclinic.com", phone: "555-1001", specialization: "Dermatology")
v2 = Vet.create!(first_name: "Meredith", last_name: "Grey", email: "grey@vetclinic.com", phone: "555-1002", specialization: "Surgery")
v3 = Vet.create!(first_name: "Solange", last_name: "Sheperd", email: "sheperd@vetclinic.com", phone: "555-1003", specialization: "Dentist")

o1 = Owner.create!(first_name: "María Olivia", last_name: "Urzua", email: "maria@mail.com", phone: "12345678", address: "Calle 1")
o2 = Owner.create!(first_name: "Ignacio", last_name: "García", email: "ignacio@mail.com", phone: "87654321", address: "Calle 2")
o3 = Owner.create!(first_name: "Carolina", last_name: "Cusacovich", email: "carolina@mail.com", phone: "11223344", address: "Calle 3")

p1 = o1.pets.create!(name: "Zeus", species: "dog", breed: "Mixed Breed", date_of_birth: "2020-06-15", weight: 15.5)
p2 = o1.pets.create!(name: "Apolo", species: "cat", breed: "Rubble", date_of_birth: "2018-08-20", weight: 6.2)
p3 = o2.pets.create!(name: "Teo", species: "rabbit", breed: "Beveren", date_of_birth: "2023-01-15", weight: 2.1)
p4 = o3.pets.create!(name: "Simon", species: "dog", breed: "Golden Retriever", date_of_birth: "2020-06-15", weight: 30.0)
p5 = o3.pets.create!(name: "Charlie", species: "cat", breed: "Domestic Cat", date_of_birth: "2021-03-22", weight: 8.4)

a1 = Appointment.create!(pet: p1, vet: v1, date: DateTime.now + 1.day, reason: "Otitis control", status: 0)
a2 = Appointment.create!(pet: p2, vet: v1, date: DateTime.now + 2.days, reason: "Allergy wound management", status: 3)
a3 = Appointment.create!(pet: p3, vet: v2, date: DateTime.now - 1.day, reason: "Sterilization surgery", status: 2)
a4 = Appointment.create!(pet: p4, vet: v3, date: DateTime.now, reason: "Dental checkup", status: 1)
a5 = Appointment.create!(pet: p5, vet: v2, date: DateTime.now - 5.days, reason: "Stomach pain", status: 2)

a3.treatments.create!(name: "Anesthesia", medication: "Propofol", dosage: "5mg", notes: "Preparation for surgery", administered_at: DateTime.now - 1.day)
a3.treatments.create!(name: "Surgery", medication: "Analgesics", dosage: "1 pastilla", notes: "Successful operation", administered_at: DateTime.now + 2.day)
a4.treatments.create!(name: "Cleaning", medication: "None", dosage: "N/A", notes: "Mild tartar", administered_at: DateTime.now)
a4.treatments.create!(name: "Extraction", medication: "Local anesthesia", dosage: "2ml", notes: "A premolar was extracted", administered_at: DateTime.now)
a5.treatments.create!(name: "Revision", medication: "Antispasmodic", dosage: "10ml", notes: "Soft diet is prescribed", administered_at: DateTime.now - 5.days)

puts "Data successfully loaded!"