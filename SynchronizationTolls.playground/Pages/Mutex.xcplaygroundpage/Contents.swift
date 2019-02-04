//: [Previous](@previous)

import Foundation

// simple mutex via pthread syntax

var mutex = pthread_mutex_t()
pthread_mutex_init(&mutex, nil)

func test() {
    pthread_mutex_lock(&mutex)
    // do something
    pthread_mutex_unlock(&mutex)
}

// simple mutex via Foundation farmework

let lock = NSLock()

func testOne() {
    lock.lock()
    // do something
    lock.unlock()
}


//: [Next](@next)
