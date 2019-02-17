//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

class CancelOperation: Operation {
    
    override func main() {
        
        for i in 1 ... 1000000 {
            if isCancelled {
                return
            }
            print(i)
        }
        
    }
}

let queue = OperationQueue()
let task = CancelOperation()
queue.addOperation(task)
sleep(2)
task.cancel()
