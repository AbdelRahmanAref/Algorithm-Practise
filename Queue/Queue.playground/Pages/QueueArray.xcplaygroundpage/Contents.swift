//: [Previous](@previous)

import Foundation

example(of: "Creating a QueueArray") {
    var queue = QueueArray<String>()
    
    queue.enqueue("Ray")
    queue.enqueue("Brian")
    queue.enqueue("Eric")
    
    print(String(describing: queue))
    
    queue.dequeue()
    
    print(String(describing: queue))
    print(queue.peek!)
}

//: [Next](@next)
