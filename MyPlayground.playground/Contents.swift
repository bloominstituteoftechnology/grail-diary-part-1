import UIKit


protocol Animal {
    var numberOfLegs: Int { get }
    func speak()
}


struct Cat: Animal {
    var numberOfLegs: Int
    func speak() {
        print("Meow")
    }
}


struct Dog: Animal {
    var numberOfLegs: Int
    func speak() {
        print("Woof")
    }
}
