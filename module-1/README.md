## Part 1: Short-answer questions



a) Question: What does the command **‘git status’** output?

- Answer: The `git status` command outputs information about:
  - Files that have been changed in your working directory since your last commit
  - Modified files that have been stged for the upcoming commit
  - The name of the branch that you're currently on
  - Untracked files that are not part of your repository

b) Question: In SwiftUI, anything that gets drawn on the screen is a _.

- Answer: View

c) Question: `print(“Hello world”)` is an example of a _ call. `viewModel.getData()` is an example of a _ call.

- Answer:

  - `print(“Hello world”)` is an example of a function call

  - `viewModel.getData()` is an example of a method call.


d) Question: Name some Views you have seen so far in SwiftUI.

- Answer: `VStack`, `HStack`, `Text`, `Button`, and `Slider`

e) Question: How do you create a new local repository using git?

- Answer: I would use the `git init` command to initialize a new Git repository in my desired directory.

f) Question: How do you preview your app in multiple orientations?

- Answer: In the Xcode Canvas Preview, you can preview multiple orientations by selecting `Variants` -> `Orientation Variants`

g) Question: An app is made up of _ of classes and structs that contain _ and _.

- Answer: objects, methods, and properties

h) Question: Name two components of a SwiftUI Button.

- Answer:
  - Label, which is the view that represents the content of the button, such as text.
  - Action, which is a function that is executed when the button is tapped.

i) Question: In git, what is the difference between a local repository and a remote repository?

- Answer: A local repository is a copy of the project's entire history and all its files tracked in version control on your local machine. A remote repository is a repoistory hosted on a remote server or a hosted platform like GitHub.

j) Give an example of camel case.

- Answer: `roundedValue`

k) What is a branch in git, and how do you create one? 

- Answer:
  -  In Git, a branch is a separate line of development that allows you to work on new features, bug fixes, or experiments without affecting the main codebase. 
  - You can create a branch and switch into in a single command using `git checkout -b <name-of-branch>`

l) What are some common mistakes that can lead to errors while programming?

- Answer:
  - To name a few: syntax errors, code duplication, not following best practices, and incomplete testing (or lack thereof).

m) Question: **VStack**, **HStack**, and **ZStack** are _ views used for _.

- Answer: Layout, organizing and aranging other views.

n) Question: How do you list the branches on your local repository?

- Answer: You can use the `git branch` command.

o) Question: What happens when **@State** variable changes in SwiftUI?

- Answer: When a `@State` variable changes, SwiftUI automatically recomputes the body of the view where the `@State` variable is used. SwiftUI updates the user interface to reflect the changes.

p) Question: What is the Single Responsibility Principle?

- Answer: A software engineering concept that referrs to creating classes or structs that have single, well-defined jobs. The example in this module was not putting all code into the `ContentView`, but creating a separate struct model to separate the responsibility of the Game from the View.

q) Question: What will the print statement below produce?\

```swift
var name = “Ozma”

print(“Hello, \(name)!”)
```

- Answer: `Hello, Ozma!`

r) Question: What commands can you use in git to download data from a remote repository? What commands can you use in git to send data to a remote repository?

- Answer: 
  - You can use `git pull` to fetch changes from a remote repository and integrate them into your current branch.  
  - You can use `git push` to send your local commits to a remote repository.

s) Question: Why is a programming To-Do list important, and what is a minimum viable product?

- Answer:
  - A programming To-Do list important because it helps you identify and prioritize what tasks need to be done.
  - A minimum viable product is the simplest version of a product that includes only the essential features needed to meet the primary objectives.

t) Question: What is a simple way of describing **Binding** in SwiftUI?

- Answer: Binding is a way of saying that a particular user interface view will always be tied to a particular state value. In the module, we binded the `Slider` value to a `State` variable that stored the value of the slider. By doing this, every time the slider is moved, the `State` variable will automatically be updated to match.

u) What command do you use in git to move changes from one branch to another?

- Answer: You would use the `git merge` command to move and merge changes from one branch into another.

v) What is the type of the variable defined below?

```
var a = 87
```

- Answer: The type of the variable is an `Int`.

w) What is the difference between var and let?

- Answer: Variables declared with `var` are mutable, which means their values to be changed or updated after they are initially assigned. Constants declared with `let` are immutable, meaning their values cannot be changed once they are assigned.





## Part 2 - Programming assignment

An app that allows the user to generate a color. Color can be created by moving each slider and choosing the red, green, and blue values.





## Part 3 - Above and Beyond

```
 struct ContentView: View {

1    @State private var sliderValue: Int = 50
2    @State private var game: Game = Game()
3    private var counter = 0
4    var body: some View {
5        Text("The score is: \(game.points(sliderValue: sliderValue))")
     }
6    func doSomethingWithCounter() {
         // to be determined
     }
 }




 struct Game {
a    var target: Int = 37
b    var score: Int = 0
c    var round: Int = 1
d    func points(sliderValue: Int) -> Int {
       return 999

    }
 }
```

- In `ContentView`, lines 1 and 2 show the definition of `State` properties.
- In `ContentView`, line 3 shows the definition of a regular variable property.
- In `ContentView`, line 4 shows the definition of a computed property.
- In `ContentView`, line 5 shows an instance of `Game` calling the method points.
- In `ContentView`, line 6 is the definition of the method `doSomethingWithCounter()`.
- In `Game`, lines a, b, and c show the definition of property variables.
- In `Game`, line d is the definition of the method `points(sliderValue: Int)`.
- Lines 3, a, b, and c are the  regular variable properties and lines 6 and d are the methods of the structs.
