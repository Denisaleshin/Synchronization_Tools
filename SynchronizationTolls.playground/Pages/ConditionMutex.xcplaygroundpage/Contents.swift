//: [Previous](@previous)

import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// This example illustraits how does Condition (or Condition lock) work

class Condition {
    
    func start() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.method1()
        }
        
        DispatchQueue.global(qos: .default).async { [weak self] in
            sleep(5)
            self?.method2()
        }
        
    }
    
    private let condition = NSCondition()
    private var check: Bool = false
    
    func method1() {
        print("Start method 1")
        
        print("Wil lock method 1")
        condition.lock()
        print("Did lock method 1")
        while(!check) {
            print("Wil wait method 1")
            condition.wait()
            print("did wait method 1")
        }
        print("metod 1 usefull work")
        
        print("Wil unlock method 1")
        condition.unlock
        print("did unlock method 1")
    }
    
    func method2() {
        print("Start method 2")
        print("Wil lock method 2")
        condition.lock()
        print("Did lock method 2")
        
        print("metod 2 usefull work")
        
        check = true
        print("Will signal method 2")
        condition.signal()
        print("Did signal method 2")
        condition.unlock()
        
    }
}
let test = Condition()

test.start()


//: [Next](@next)
