import Cocoa

// Part 2 - Programming assignment.

/*

 a) Create an array of Int called nums with values 0 through 20.
 Iterate over the Array and print the even numbers.

 */

let nums = Array(0...20)
for num in nums {
  // An even number will have a remainder of 0 when divisible by 2
  if num % 2 == 0 {
    print(num)
  }
}


/*

 b) In your Playground, define the following String:
 let sentence = “The qUIck bRown fOx jumpEd over the lAzy doG”

 Iterate over sentence counting the vowels (a, e, i, o, u), ignoring the case.

 */

let sentence = "The qUIck bRown fOx jumpEd over the lAzy doG"

func countVowels(_ sentence: String) -> Int {
  let vowels: Set<Character> = Set(["a", "e", "i", "o", "u"])

  var vowelCount = 0
  for char in sentence.lowercased() {
    if vowels.contains(char) {
      vowelCount += 1
    }
  }

  return vowelCount
}

print("Number of vowels in the sentence is: \(countVowels(sentence))")

/*

 c) Create two arrays of Int with the values of 0 through 4.
 Use a nested for loop to print a mini multiplication table.
 The output, which should be multiple lines, should be in the following format:
 0 * 0 = 0

 */

let array1 = Array(0...4)
let array2 = Array(0...4)

for num1 in array1 {
  for num2 in array2 {
    let result = num1 * num2
    print("\(num1) * \(num2) = \(result)")
  }
}

/*

 d) Write a function called average that takes an optional array of Int.
 If the array is not nil, calculate the average of the array's values and print:
 “The average of the values in the array is <average>.”

 Where <average> is the calculated average. If the array is nil, print:
 “The array is nil. Calculating the average is impossible.”

 */

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

calculateAverage(nums)

let optionalArray: [Int]? = Array(0...100)
calculateAverage(optionalArray)

/*

 e) Create a struct called Person with the properties firstName, lastName, and age. Choose appropriate data types for the properties.

 Include a method on Person called details that prints the values stored in the properties in the following format:
 Name: <firstName> <lastName>, Age: <age>

 Create an instance of Person called person. Pass your first name, last name, and age for the properties. Finally, call the method details.

 */

struct Person {
  let firstName: String
  let lastName: String
  let age: Int

  func details() {
    print("Name: \(self.firstName) \(self.lastName), Age: \(self.age)")
  }
}

let person = Person(firstName: "Nathan", lastName: "Krishnan", age: 32)
person.details()

/*

 f) Create a class called Student with two properties: person of type Person and grades, an array of Int. The class must have a method called calculateAverageGrade that takes no parameters and returns a Double.

 Include a method called details that prints the values of the properties stored in Student along with the average grade in the following format:
 Name: <firstName> <lastName>, Age: <age>, GPA: <average grade>

 Create an instance of Student called student passing in your first name, last name, age, and an array of five numbers: 94, 99, 81, 100, 79. Next call the details method to output the details of the student.

 */

class Student {
  let person: Person
  var grades: [Int]

  init(person: Person, grades: [Int]) {
    self.person = person
    self.grades = grades
  }

  func calculateAverageGrade() -> Double {
    if grades.isEmpty {
      print("The grades array is empty. No grades to calculate the average of. Returning 0.")
      return 0.0
    }

    var sum = 0
    for grade in grades {
      sum += grade
    }

    let average = Double(sum) / Double(grades.count)
    return average
  }

  func details() {
    let averageGrade = self.calculateAverageGrade()

    print("Name: \(self.person.firstName) \(self.person.lastName), Age: \(self.person.age), GPA: \(averageGrade).")
  }
}

let student = Student(person: Person(firstName: "Nathan", lastName: "Krishnan", age: 32), grades: [94, 99, 81, 100, 79])
student.details()


// Part 3 - Above and Beyond.

struct Square {
  var side: Int

  func area() -> Int {
    return side * side
  }
}

class Rectangle {
  var length: Int
  var width: Int

  init(length: Int, width: Int) {
    self.length = length
    self.width = width
  }

  func area() -> Int {
    return length * width
  }
}


var square1 = Square(side: 4)
var square2 = square1
square2.side = 5

print("Area: square1 - \(square1.area()) square2 - \(square2.area())")


var rectangle1 = Rectangle(length: 4, width: 4)
var rectangle2 = rectangle1
rectangle2.length = 5

print("Area: rectangle1 - \(rectangle1.area()) rectangle2 - \(rectangle2.area())")

/*

 The difference between the area values printed for the square and rectangle are due to the differences between structs and classes in Swift.

 Structs are value types, which means that when you assign a struct instance to another variable, a copy of the instance is created, and modifications to one instance do not affect the other. This is why the area calculated for square1 and square 2 are different.

 Classes are reference types, which means that when you assign a class instance to another variable, both variables refer to the same instance in memory. Modifications to one instance are reflected in the other because they both point to the same memory location. This is why the area calculated for rectangle1 and rectangle2 are the same.

*/
