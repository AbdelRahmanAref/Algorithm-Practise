import Foundation

public struct PrioityQueueArray<Element: Equatable>: Queue {
    
    private var array: [Element]
    let sort: (Element, Element) -> Bool
    
    public init(sort: @escaping (Element, Element) -> Bool, array: [Element] = []) {
        self.sort = sort
        self.array = array.sorted(by: sort)
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var peek: Element? {
        return array.first
    }
    
    public mutating func enqueue(_ element: Element) -> Bool {
        // Iterate through the current elements in the queue until
        // we find a pair of elements that match the sort requirement
        for (index, otherElement) in array.enumerated() {
            if sort(element, otherElement) {
                array.insert(element, at: index)
                return true
            }
        }
        
        // if no nodes currently in the queue satisfy the sort requirement,
        // append the value to the end
        array.append(element)
        return true
    }
    
    public mutating func dequeue() -> Element? {
        return isEmpty ? nil : array.removeFirst()
    }
    
}
