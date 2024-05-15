## Part 1 - Short answer questions



a) Question: List two Collection Types in Swift.

- Answer:
  1. Arrays
  2. Sets



b) Question: Name a function that uses **variadic** parameters.

- Answer: The `print()` function is variadic and can take any number of parameters.



c) Question: True or False: Only a **class** can adopt a protocol in Swift.

- Answer: False, because structs and enums can also adopt protocols.



d) Question: Name the four **Named Types** you have been introduced to so far.

- Answer:

  1. Classes
  2. Structs
  3. Enums
  4. Protocols

  

e) Question: The variadic parameter is treated as an _____________ in the function.

- Answer: array



f) Question: In Swift, **structs** are ____________ types, and **classes** are _____________ types.

- Answer: structs are value types, and classes are reference types.



g) Question: True or False: Functions in Swift, by default, can alter parameters passed to the function.

- Answer: False, because by default when you pass a parameter to a function it will be passed by value. In other words, a copy of the parameter's value is made. To allow the function to modify the parameter directly, you would need to prefix it with the `inout` keyword.



h) Question:  ______________ are what a **type** has, and ____________ are what a **type** can do.

- Answer: Properties are what a type has, and methods are what a type can do.



i) Question:  A **class**, **struct**, or **enum** that adopts a protocol is said to _______________ to the protocol.

- Answer: conform



j) Question: A lazy property is calculated only when ________________________.

- Answer: it is first accessed.



k) Question: True or False: Extensions in Swift allow you to add new functionality to an existing type.

- Answer: True



l) Question: True or False: A convenience initializer in Swift is responsible for initializing properties of a class.

- Answer: False, convenience initializers are used to create additional ways to initialize an instance, but don't directly initialize all properties. Designated initializers have the primary responsiblity for initializing all the properties.