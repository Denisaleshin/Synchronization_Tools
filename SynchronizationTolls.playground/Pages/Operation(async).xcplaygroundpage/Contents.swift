//: [Previous](@previous)

import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

var str = "Hello, playground"

//: [Next](@next)
class AsyncOperation: Operation {
    private var finish = false
    private var exequte = false
    private let queue = DispatchQueue(label: "Concurent")
    
    override var isAsynchronous: Bool { return true }
    override var isFinished: Bool { return finish }
    override var isExecuting: Bool {return exequte}
    
    override func start() {
        willChangeValue(forKey: "isExecuting")
        queue.async {
            self.main()
        }
        exequte = true
        didChangeValue(forKey: "isExecuting")
    }
    
    override func main() {
        print("test")
         willChangeValue(forKey: "isFinished")
         willChangeValue(forKey: "isExecuting")
        
        finish = true
        exequte = false
        
        didChangeValue(forKey: "isExecuting")
        didChangeValue(forKey: "isFinished")
    }
    
}
