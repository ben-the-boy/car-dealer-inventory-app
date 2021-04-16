user1 = User.create(username: "user1", password: "password", dealership: "Dealer1")
user2 = User.create(username: "user2", password: "password", dealership: "Dealer2")
user3 = User.create(username: "user3", password: "password", dealership: "Dealer3")
user4 = User.create(username: "user4", password: "password", dealership: "Dealer4")
user5 = User.create(username: "user5", password: "password", dealership: "Dealer5")

user1.vehicles.create(brand: "BMW", model: "X5", style: "SUV", mileage: "10,000", year: "2020",
color: "silver")
user1.vehicles.create(brand: "Chevrolet", model: "Corvette", style: "Coupe", mileage: "0", year: "2021",
color: "red")
user2.vehicles.create(brand: "Ford", model: "F150", style: "Truck", mileage: "5,000", year: "2019",
color: "black")
user3.vehicles.create(brand: "Audi", model: "A4", style: "Sedan", mileage: "15,000", year: "2018",
color: "white")
user4.vehicles.create(brand: "Toyota", model: "Camry", style: "Sedan", mileage: "25,000", year: "2015",
color: "green")
user5.vehicles.create(brand: "Jeep", model: "Grand Cherokee", style: "SUV", mileage: "15,000", year: "2019",
color: "black")
