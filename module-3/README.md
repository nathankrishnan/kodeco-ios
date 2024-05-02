## Part 1 - Short answer questions



a) Question: `0…5` and`0..<5` are two types of ____________. How are they different?

- Answer: These are two types of range operators.
  - `0...5` uses the closed range operator to define a range that runs from 0 to 5. This means that both the lower and upper bounds are included.
  - `0..<5` uses the half-open range operator to define a range that starts from 0, and goes up to, but does not include 5. This means that the lower bound is included, but not the upper bound.



 b) Question: Describe type inference in Swift and give an example.

- Answer: Type inference in Swift is the ability for the Swift compiler to deduce the data type of a variable or function automatically based on its initialization value or context. When the type is inferred, you do not need to add explicit type annotations. 
- As an example:

```
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

let result = add(1, 4)
```

- The Swift compiler infers that the type of the constant `result` is an `Int` based on the return type of the `add` function.



c) Question: List three advantages of Playgrounds.

- Answer:

  - Experimenting with code

    - Playgrounds provide an interactive environment for experimenting with Swift code and quickly seeing the results of the code without needing to create an Xcode Project.

  - Documenting learning

    - Playgrounds support markdown which makes it easy and expressive to document Swift code, which makes it a good virtual learning notebook

  - Collaboration and sharing

    - Playgrounds are easy to share with others for review, feedback, and collaboration.

      

d) Question: When does the execution of a while loop end?

- Answer: Until the `while` loop's condition evaluates to `false`.



e) Question: True or False: Tuples in Swift can contain values of different data types.

- Answer: True, tuples in Swift can contain values of different data types. For example:

```
let person: (String, Int, Bool) = ("Nathan", 32, true)
```



 f) Question: List three data types you have used in Swift.

- Answer:
  - Arrays
  - Dictionaries
  - Tuples



g) Question: To execute alternative code when the condition of an `if` statement is not met, you can use what clause?

- Answer: You can use the `else` clause to execute alternative code when the condition of an `if` statement is not met.



h) Question: What is the third element of the array `nums` defined below?  

```
let nums = [5, 0, 44, 20, 1]
```

- The third element is `44` and you would access it using index `2` .



i) Question: An ____________ is a unit of code that resolves to a single value.

- Answer: A function



j) Question: Define two ways to unwrap optionals in Swift.

- 1: Force unwrapping
  - For example:

```
let optionalValue: Int? = 32
let unwrappedValue = optionalValue!
```



- 2: Optional binding
  - For example:

```
// Using if let

let optionalValue: Int? = 32
if let unwrappedValue = optionalValue {
    print(unwrappedValue)
} else {
    print("Optional is nil")
}

// Using guard let

let optionalValue: Int? = 42
guard let unwrappedValue = optionalValue else {
    print("Optional is nil")
    return 
}
```



k) Question: True or False: The condition in an `if` statement must be true or false.

- Answer: True, the condition in an `if` statement must be an expression that evaluates to a Boolean value, which would be either `true` or `false`.



l) Question: Arrays in Swift are ____________ indexed.

- Arrays in Swift are zero-indexed. This means that the first element of an array is `0`, the second element is `1`, and so on. 



m) Question: An unordered collection of unique values of the same type is a _____________.

- Answer: An unordered collection of the same type is called a Set.