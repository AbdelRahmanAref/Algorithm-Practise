import Foundation

// Conform to Equatable since we need to compare elements
// Conform to Queue since PQ provides the same functionality

public struct PriorityQueue<Element: Equatable>: Queue {
    
    private var heap: Heap<Element>
    
    public var isEmpty: Bool {
        return heap.isEmpty
    }
    
    public var peek: Element? {
        return heap.peek()
    }
    
    public init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        heap = Heap(sort: sort, elements: elements)
    }
    
    public mutating func enqueue(_ element: Element) -> Bool {
        heap.insert(element)
        return true
    }
    
    public mutating func dequeue() -> Element? {
        return heap.remove()
    }
    
}
