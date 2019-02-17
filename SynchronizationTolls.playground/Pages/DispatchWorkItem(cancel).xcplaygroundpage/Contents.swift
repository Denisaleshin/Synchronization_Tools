//: [Previous](@previous)

import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

var str = "Hello, playground"

//: [Next](@next)

let queue = DispatchQueue(label: "DispatchWorkitemTest")

// Cancelation Item before has been started

func cancelBefore() {
    queue.async {
        sleep(1)
        print("test1")
    }
    queue.async {
        sleep(1)
        print("test2")
    }
    
    let item = DispatchWorkItem {
        print("test")
    }
    
    queue.async(execute: item)
    item.cancel()
    
}
cancelBefore()


