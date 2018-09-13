import Foundation

public struct QueueLinkedList<Element>: Queue {
    
    private var list = DoublyLinkedList<Element>()
    
    public init() {}
    
    public mutating func enqueue(_ element: Element) -> Bool {
        list.append(element)
        return true
    }
    
    public mutating func dequeue() -> Element? {
        guard !list.isEmpty, let first = list.first else {
            return nil
        }
        
        return list.remove(first)
    }
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
    public var peek: Element? {
        return list.first?.value
    }
    
}

extension QueueLinkedList: CustomStringConvertible {
    public var description: String {
        return String(describing: list)
    }
}
