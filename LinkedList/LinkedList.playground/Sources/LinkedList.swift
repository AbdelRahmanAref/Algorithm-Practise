// Creating a linked list in Swift

public class Node<T: Comparable> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> \(String(describing: next)) "
    }
}

// create the linked list
public struct LinkedList<T: Comparable> {
    var head: Node<T>?
    var tail: Node<T>?
    
    public init() {}
    
    public var isEmpty: Bool { return head == nil }
    
    // returns a node at the specific index, if it doesn't exist returns nil
    public func node(at index: Int) -> Node<T>? {
        var currentNode = head
        var currentIndex = 0
        
        while (currentNode != nil && currentIndex < index) {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    // MARK: - Insertion operations
    
    // push an element to the front of the list
    public mutating func push(_ value: T) {
        copyNodes()
        head = Node(value: value, next: head)
        
        // when pushing an element to an empty list
        if tail == nil { tail = head }
    }
    
    // append an element to the end of the list
    public mutating func append(_ value: T) {
        copyNodes()
        
        guard !isEmpty else {
            // if the list is empty, append is functionality equivalent to push
            push(value)
            return
        }
        
        tail?.next = Node(value: value)
        tail = tail?.next
    }
    
    // insert a node after another node in the list
    @discardableResult
    public mutating func insert(_ value: T, after node: Node<T>) -> Node<T> {
        copyNodes()
        
        guard tail !== node else {
            // if inserting after the tail, insert is functionality equivalent to append
            append(value)
            return tail!
        }
        
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    // MARK: - Removal operations
    
    // removes the head node of the linked list
    public mutating func pop() -> T? {
        defer {
            copyNodes()
            // only need to resign head. ARC will clean up the old head value
            head = head?.next
            // in the case where the last element has been popped
            if isEmpty { tail = nil }
        }
        return head?.value
    }
    
    // removes the last item of the linked list
    public mutating func removeLast() -> T? {
        guard !isEmpty else { return nil }
        copyNodes()
        
        // if only one elment, removeLast functionality equivalent to pop
        guard head?.next != nil else { return pop() }
        
        var prev = head
        var current = head
        
        // iterate through the list until next points to nil (tail value)
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
            copyNodes()
            // if removing value tail value, set tail ref to second last value ARC will clean the old tail value
            if node.next === tail { tail = node }
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
    
        
    // reverse the linked list
    public mutating func reverse() {
        var prev = head
        var current = head?.next
        prev?.next = nil
        
        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        
        head = prev
    }
    
    // remove occurences of value from the linked list
    public mutating func removeOccurencesOf(_ value: T) {
        while let head = head, head.value == value {
            self.head = head.next
        }
        
        var prev = head
        var current = head?.next
        
        while let currentNode = current {
            guard currentNode.value != value else {
                prev?.next = currentNode.next
                current = prev?.next
                continue
            }
            
            prev = current
            current = current?.next
        }
    }
    
    // copyNodes added to support copy on write functionaity
    private mutating func copyNodes() {
        guard !isKnownUniquelyReferenced(&head) else { return }
        guard var oldNode = head else { return }
        
        head = Node(value: oldNode.value)
        var newNode = head
        
        while let nextOldNode = oldNode.next {
            newNode?.next = Node(value: nextOldNode.value)
            newNode = newNode?.next
            
            oldNode = nextOldNode
        }
        
        tail = newNode
    }
    
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        // for the case of an empty list print nothing
        guard let head = head else { return "" }
        return String(describing: head)
    }
}

// Conforming to the Collection Protocol
extension LinkedList: Collection {
    
    public struct Index: Comparable {
        public var node: Node<T>?
        
        static public func == (lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }
        
        static public func < (lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else {
                return false
            }
            
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains {$0 === rhs.node }
        }
    }
    
    public var startIndex: Index {
        return Index(node: head)
    }
    
    public var endIndex: Index {
        return Index(node: tail?.next)
    }
    
    public func index(after i: Index) -> Index {
        return Index(node: i.node?.next)
    }
    
    public subscript(position: Index) -> T {
        return position.node!.value
    }
    
}
