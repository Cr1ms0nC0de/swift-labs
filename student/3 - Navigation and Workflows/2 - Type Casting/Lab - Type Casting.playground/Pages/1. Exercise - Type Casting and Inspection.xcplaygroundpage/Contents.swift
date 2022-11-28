/*:
## Exercise - Type Casting and Inspection

 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
let stuff : [Any] = [1.2,1.3,7,6,"pd","ds", true, false]
for i in stuff{
    print(i)
}
//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for i in stuff{
    if let num = i as? Int{
        print("The integer has a value of \(num)")
    }
    else if let num = i as? Double{
        print("The double has a value of \(num)")
    }
    else if let num = i as? String{
        print("The string has a value of \(num)")
    }
    else if let num = i as? Bool{
        print("The boolean has a value of \(num)")
    }
}

//:  Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
let dic : [String : Any] = ["1": 1, "234": false, "faes": 2.3, "face": "no"]
print(dic)

//:  Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
var total : Double = 0
for i in dic{
    if let num = i as? (key: String, value: Int){
        total += Double(num.value)
    }
    else if let num = i as? (key: String, value: Double){
        total += num.value
    }
    else if i is (key: String, value: String){
        total += 1
    }
    else if let num = i as? (key: String, value: Bool){
        if num.value{
            total += 2
        }
        else{
            total -= 3
        }
    }
}
print("The total value is \(total)")

//:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
var total2 : Double = 0
for i in dic{
    if let num = i as? (key: String, value: Int){
        total2 += Double(i.key) ?? 0
        total2 += Double(num.value)
    }
    else if let num = i as? (key: String, value: Double){
        total2 += Double(i.key) ?? 0
        total2 += num.value
    }
    else if i is (key: String, value: String){
        total2 += Double(i.key) ?? 0
        total2 += i.value as? Double ?? 0
    }
    else if i is (key: String, value: Bool){
        total2 += Double(i.key) ?? 0
    }
}
print("The total value is \(total2)")


/*:
page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
 */
