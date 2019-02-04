
import Foundation

// simple recursive mutex using PThread syntax
class RecursivePThreadMutex {
    
    private var mutex = pthread_mutex_t()
    private var attribute = pthread_mutexattr_t()
    
    init() {
        pthread_mutexattr_init(&attribute)
        pthread_mutexattr_settype(&attribute, PTHREAD_MUTEX_RECURSIVE)
        pthread_mutex_init(&mutex, &attribute)
    }
    
    func lock() {
        pthread_mutex_lock(&mutex)
    }
    
    func unlock() {
        pthread_mutex_unlock(&mutex)
    }
    
    
}

let mutex = RecursivePThreadMutex() // it is possible just use NSRecursiveLock instead RecursivePThreadMutex
func test() {
    mutex.lock()
    testOne()
    mutex.unlock()
}

func testOne() {
    mutex.lock()
    // do something
    mutex.unlock()
}
