# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# 	AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

PurchaseStatus.delete_all
PurchaseStatus.create! id: 1, name: "In Progress"
PurchaseStatus.create! id: 2, name: "Placed"
PurchaseStatus.create! id: 3, name: "Shipped"
PurchaseStatus.create! id: 4, name: "Cancelled"
