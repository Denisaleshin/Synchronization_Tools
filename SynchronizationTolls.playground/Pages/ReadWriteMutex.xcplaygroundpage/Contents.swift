//: [Previous](@previous)

import Foundation


// ReadWriteLock via .barrier flag example

class BarrierReadWriteLock {
    
    private var protectedResourse: Int = 0
    private let queue = DispatchQueue(label:"Internal", attributes: .concurrent)
    
    func setResourse(_ value: Int) {
        queue.async(flags: .barrier) {
            self.protectedResourse = value
        }
    }
    
    func getResourse() -> Int {
        var tmp: Int = 0
        queue.sync {
            tmp = self.protectedResourse
        }
        return tmp
    }
}


//: [Next](@next)
