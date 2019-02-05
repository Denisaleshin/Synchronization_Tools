//: [Previous](@previous)

import Foundation


let semaphore = DispatchSemaphore(value:1)

func threadSafeWork() {
    semaphore.wait()
    // do something
    semaphore.signal
}

// Example of safe asyncronous acess to array

class LockedNumbers {
    
    let semaphore = DispatchSemaphore(value: 1)
    var elements: [Int] = []
    
    func append(_ num: Int) {
        self.semaphore.wait()
        self.elements.append(num)
        self.semaphore.signal()
    }
    
    func removeLast() {
        self.semaphore.wait()
        if !self.elements.isEmpty  {
            self.elements.removeLast()
        }
        self.semaphore.signal()
    }
}


//: [Next](@next)
