/*:
## Exercise - Adopt Protocols: CustomStringConvertible, Equatable, and Comparable
 
 Create a `Human` class with two properties: `name` of type `String`, and `age` of type `Int`. You'll need to create a memberwise initializer for the class. Initialize two `Human` instances.
 */

import Foundation
class Human: CustomStringConvertible, Equatable, Comparable, Codable{

    var name: String
    var age: Int
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    
    var description: String{
        return "\(name) is \(age) years old"
    }
    
    static func == (lhs: Human, rhs: Human) -> Bool {
        return lhs.name == rhs.name && lhs.age == lhs.age
    }
    
    static func < (lhs: Human, rhs: Human) -> Bool {
        return lhs.age < rhs.age
    }
}

var bob = Human(name: "Bob", age: 18)
var sam = Human(name: "Sam", age: 17)
//:  Make the `Human` class adopt the `CustomStringConvertible` protocol. Print both of your previously initialized `Human` objects.
print(bob)
print(sam)

//:  Make the `Human` class adopt the `Equatable` protocol. Two instances of `Human` should be considered equal if their names and ages are identical to one another. Print the result of a boolean expression evaluating whether or not your two previously initialized `Human` objects are equal to eachother (using `==`). Then print the result of a boolean expression evaluating whether or not your two previously initialized `Human` objects are not equal to eachother (using `!=`).
print(bob == sam)
print(bob != sam)
//:  Make the `Human` class adopt the `Comparable` protocol. Sorting should be based on age. Create another three instances of a `Human`, then create an array called `people` of type `[Human]` with all of the `Human` objects that you have initialized. Create a new array called `sortedPeople` of type `[Human]` that is the `people` array sorted by age.
var matt = Human(name: "Matt", age: 19)
var toby = Human(name: "Toby", age: 16)
var joe = Human(name: "Joe", age: 20)

var sortedHumans = [bob,sam,matt,toby,joe].sorted(by: <)

for human in sortedHumans{
    print(human)
}

//:  Make the `Human` class adopt the `Codable` protocol. Create a `JSONEncoder` and use it to encode as data one of the `Human` objects you have initialized. Then use that `Data` object to initialize a `String` representing the data that is stored, and print it to the console.
var ben = Human(name: "Ben", age: 21)

let jsonEncoder = JSONEncoder()
if let jsonData = try? jsonEncoder.encode(ben), let jsonString = String(data: jsonData, encoding: .utf8){
    print(jsonString)
}
/*:
page 1 of 5  |  [Next: App Exercise - Printable Workouts](@next)
 */
