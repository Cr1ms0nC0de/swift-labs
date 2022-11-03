/*:
## Exercise - Structs, Instances, and Default Values
 
 Imagine you are creating an app that will monitor location. Create a `GPS` struct with two variable properties, `latitude` and `longitude`, both with default values of 0.0.
 */
struct GPS{
    var latitude : Double = 0.0
    var longitude : Double = 0.0
    
    func printCords() {
        print("Latitude: \(self.latitude)\nLongitude: \(self.longitude)")
    }
}

//:  Create a variable instance of `GPS` called `somePlace`. It should be initialized without supplying any arguments. Print out the latitude and longitude of `somePlace`, which should be 0.0 for both.
var somePlace = GPS()
somePlace.printCords()
print("\n")

//:  Change `somePlace`'s latitude to 51.514004, and the longitude to 0.125226, then print the updated values.
somePlace.latitude = 51.51
somePlace.longitude = 0.12
somePlace.printCords()
print("\n")
//:  Now imagine you are making a social app for sharing your favorite books. Create a `Book` struct with four variable properties: `title`, `author`, `pages`, and `price`. The default values for both `title` and `author` should be an empty string. `pages` should default to 0, and `price` should default to 0.0.
struct Book{
    var title : String = ""
    var author : String = ""
    var pages : Int = 0
    var price : Double = 0.0
    
}

//:  Create a variable instance of `Book` called `favoriteBook` without supplying any arguments. Print out the title of `favoriteBook`. Does it currently reflect the title of your favorite book? Probably not. Change all four properties of `favoriteBook` to reflect your favorite book. Then, using the properties of `favoriteBook`, print out facts about the book.
var favoriteBook = Book()
print(favoriteBook.title)
favoriteBook.author = "Joe Mamma"
favoriteBook.pages = 69
favoriteBook.price = 420.69
favoriteBook.title = "Nice"
print("\(favoriteBook.title) by \(favoriteBook.author) is my favorite book. It has \(favoriteBook.pages) pages and costs \(favoriteBook.price)$")

/*:
page 1 of 10  |  [Next: App Exercise - Workout Tracking](@next)
 */
