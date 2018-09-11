// Creating a linked list in Swift 

// create the node class first
// (needs to be the class type since we need to use references)
public class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

// Conform to the CustomStringConvertible
extension Node: CustomStringConvertible {
    public var description: String {
        // when the linked list count is only 1 element
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> \(String(describing: next)) "
    }
}

// create the linked list
public struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    // linked list operations
    
    // add an element to the front of the list
    public mutating func push(_ value: T) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    // append an element to the end of the list
    public mutating func append(_ value: T) {
        guard !isEmpty else {
            // if the list is empty
            push(value)
            return
        }
        
        tail?.next = Node(value: value)
        tail = tail?.next
        
    }
    
    // returns a node at a specific index. If the index is out of bounds the function will return nil
    public func node(at index: Int) -> Node<T>? {
        var currentNode = head
        var currentIndex = 0
        
        while (currentNode != nil && currentIndex < index) {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    // insert a node after another node already in the list
    @discardableResult
    public mutating func insert(_ value: T, after node: Node<T>) -> Node<T> {
        guard tail !== node else {
            // in the case where we're inserting after the tail.
            append(value)
            return tail!
        }
        
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    // removal operations
    
    // removes the head node of the linked list
    public mutating func pop() -> T? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    // removes the last item of the linked list
    public mutating func removeLast() -> T? {
        guard !isEmpty else {
            // if head is nil the list is empty
            return nil
        }
        
        guard head?.next != nil else {
            // if only one elment pop the element
            return pop()
        }
        
        var prev = head
        var current = head
        
        while let next = current?.next {
            prev = current
            current = next
        }
        
        prev?.next = nil
        tail = prev
        
        return current?.value
    }
    
    // removes the value after a specified node
    public mutating func remove(after node: Node<T>) -> T? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        // for the case of an empty list print nothing
        guard let head = head else {
            return ""
        }
        
        return String(describing: head)
    }
}
