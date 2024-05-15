import Cocoa


/*

 a) In the assignment for Module 3, part D asked you to write a function that would compute the average of an array of Int. Using that function and the array created in part A, create two overloaded functions of the function average.

*/


// Original Function
func calculateAverage(_ inputArray: [Int]? = nil) {
  // Check if the inputArray is nil
  guard let unwrappedArray = inputArray else {
    print("The array is nil. Calculating the average is impossible.")
    return
  }

  // Check if inputArray is empty
  guard unwrappedArray.count > 0 else {
    print("The array is empty. Calculating the average is impossible.")
    return
  }

  var sum = 0
  for number in unwrappedArray {
    sum += number
  }

  let average = sum / unwrappedArray.count
  print("The average of the values in the array is \(average).")
}


// Overloaded Function 1: Variadic parameters of type Int
func calculateAverage(_ numbers: Int...) {
  guard numbers.count > 0 else {
    print("No numbers provided. Calculating the average is impossible.")
    return
  }

  let sum = numbers.reduce(0, +)
  let average = sum / numbers.count
  print("The average of the values in the array is \(average).")
}


// Overloaded Function 2: inputArray of type [Int] and function return type Double
func calculateAverage(_ inputArray: [Int]) -> Double {
  guard inputArray.count > 0 else {
    print("(Invalid input array. Calculating the average is impossible.")
    return 0
  }

  let sum = inputArray.reduce(0, +)
  let average = Double(sum) / Double(inputArray.count)
  print("The average of the values in the array is \(average).")
  return average
}


// Tests to confirm results of using overloaded functions
print("// Original Function")
let numbers: [Int]? = [1, 2, 3, 4, 5]
calculateAverage(numbers)
print("\n")

print("// Overloaded Function 1: Variadic parameters of type Int")
calculateAverage(1, 2, 3, 4, 5)
print("\n")

print("// Overloaded Function 2: inputArray of type [Int] and function return type Double")
if let numbers = numbers {
  calculateAverage(numbers)
  print("\n")
}


/*

 b) Create an enum called Animal that has at least five animals. Next, make a function called theSoundMadeBy that has a parameter of type Animal. This function should output the sound that the animal makes. For example, if the Animal pass is a cow, the function should output, “A cow goes moooo.” Hint: Do not use if statements to complete this section.

 Call the function twice, sending a different Animal each time.

*/


enum Animal {
  case dog
  case cat
  case cow
  case bird
  case frog
}

func theSoundMade(animal: Animal) -> String {
  switch animal {
  case .dog:
    return "A dog does bark."
  case .cat:
    return "A cat goes meow."
  case .cow:
    return "A cow goes moooo."
  case .bird:
    return "A bird goes chirp."
  case .frog:
    return "A frog goes ribbit."
  }
}

theSoundMade(animal: .frog)
theSoundMade(animal: .bird)


/*

 c) This question will have you creating multiple functions that will require you to use closures and collections. First, you will do some setup.


 Create an array of Int called nums with the values of 0 to 100.

 Create an array of Int? called numsWithNil with the following values:

 79, nil, 80, nil, 90, nil, 100, 72


 Create an array of Int called numsBy2 with values starting at 2 through 100, by 2.

 Create an array of Int called numsBy4 with values starting at 2 through 100, by 4.


 You can set the values of the arrays above using whatever method you find the easiest. In previous modules, you were introduced to ranges and sequences in Swift. Leveraging those in the Array initializer will allow you to create the requested arrays in a single line. Don’t let the last two break your stride

*/

let nums = Array(0...10)
let numsWithNil = [79, nil, 80, nil, 90, nil, 100, 72]
let numsBy2 = Array(stride(from: 2, through: 100, by: 2))
let numsBy4 = Array(stride(from: 2, through: 100, by: 4))

func evenNumbersArray(_ numbers: [Int]) -> [Int] {
  return numbers.filter { $0 % 2 == 0 }
}

print("\n")
print("evenNumbersArray output:")
print(evenNumbersArray(nums))


func sumOfArray(_ numbers: [Int?]) -> Int {
  // New array of non-nil numbers from input
  let validNumbers = numbers.compactMap { $0 }

  return validNumbers.reduce(0, +)
}

print("\n")
print("sumOfArray output:")
print(sumOfArray(numsWithNil))


func commonElementsSet(_ firstValues: [Int], _ secondValues: [Int]) -> Set<Int> {
  return Set(firstValues).intersection(Set(secondValues))
}

print("\n")
print("commonElementsSet output:")
print(commonElementsSet(numsBy2, numsBy4))



/*

 d) Create a struct called Square that has a stored property called sideLength and a computed property called area. Create an instance of Square and print out the area.

*/

struct Square {
  var sideLength: Double

  var area: Double {
    return sideLength * sideLength
  }
}

let smallSquare = Square(sideLength: 2.0)
print("\n")
print("The area of the square is: \(smallSquare.area)")



/*

 Part 3 - Above and Beyond

 Create a protocol called Shape with a calculateArea() -> Double method. Create two structs called Circle and Rectangle that conform to the protocol Shape. Both Circle and Rectangle should have appropriate stored properties for calculating the area.


 Create instances of Circle and Rectangle and print out the area for each.


 Next, extend the protocol Shape to add a new method called calculateVolume() -> Double.


 Finally, create a struct called Sphere that conforms to Shape. Sphere should have appropriate stored properties for calculating area and volume.


 Create an instance of Sphere and print out the area and volume.

*/

protocol Shape {
  func calculateArea() -> Double
}

struct Circle: Shape {
  var radius: Double

  func calculateArea() -> Double {
    return Double.pi * (radius * radius)
  }
}

struct Rectangle: Shape {
  var length: Double
  var width: Double

  func calculateArea() -> Double {
    return length * width
  }
}

let mediumCircle = Circle(radius: 50.0)
print("\n")
print("The area of the mediumCircle is:", mediumCircle.calculateArea())

let smallRectangle = Rectangle(length: 6.0, width: 4.0)
print("The area of the smallRectangle is:", smallRectangle.calculateArea())

extension Shape {
  func calculateVolume() -> Double {
    return 0.0 // Default value, which can be overriden by Shape types
  }
}

struct Sphere: Shape {
  var radius: Double

  func calculateArea() -> Double {
    return 4 * Double.pi * (radius * radius)
  }

  func calculateVolume() -> Double {
    return (4/3) * Double.pi * (radius * radius * radius)
  }
}

let smallSphere = Sphere(radius: 5.0)
print("The area of the smallSphere is:", smallSphere.calculateArea())
print("The volume of the smallSphere is:", smallSphere.calculateVolume())
