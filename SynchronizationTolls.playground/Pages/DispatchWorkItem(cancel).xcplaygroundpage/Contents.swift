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
// cancelBefore()

// Cancelation Item after has been started

var workItem: DispatchWorkItem?
workItem = DispatchWorkItem {
    for i in 1..<6 {
        guard let item = workItem, !item.isCancelled else {
            print("cancelled")
            break
        }
        sleep(1)
        print(String(i))
    }
}

workItem?.notify(queue: .main) {
    print("done")
}

DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(2)) {
    workItem?.cancel()
}
DispatchQueue.main.async(execute: workItem!)


