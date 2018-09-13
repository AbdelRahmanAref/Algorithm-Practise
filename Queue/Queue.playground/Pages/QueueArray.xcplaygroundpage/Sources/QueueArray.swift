import Foundation

public struct QueueArray<Element>: Queue {

    private var array: [Element] = []
    
    public init() {}
    
    public mutating func enqueue(_ element: Element) -> Bool {
        array.append(element)
        return true
    }
    
    public mutating func dequeue() -> Element? {
        return array.isEmpty ? nil : array.removeFirst()
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var peek: Element? {
        return array.first
    }
}

extension QueueArray: CustomStringConvertible {
    public var description: String {
        return String(describing: array)
    }
}
