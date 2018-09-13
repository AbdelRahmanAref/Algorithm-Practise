import Foundation

public struct QueueRingBuffer<Element>: Queue {
    
    private var ringBuffer: RingBuffer<Element>
    
    public init(count: Int) {
        ringBuffer = RingBuffer<Element>(count: count)
    }
    
    public mutating func enqueue(_ element: Element) -> Bool {
        return ringBuffer.write(element)
    }
    
    public mutating func dequeue() -> Element? {
        return ringBuffer.read()
    }
    
    public var isEmpty: Bool {
        return ringBuffer.isEmpty
    }
    
    public var peek: Element? {
        return ringBuffer.first
    }
    
}

extension QueueRingBuffer: CustomStringConvertible {
    public var description: String {
        return String(describing: ringBuffer)
    }
}
