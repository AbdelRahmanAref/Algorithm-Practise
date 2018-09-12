import Foundation

public func example(of description: String, action: () -> ()) {
    print("---Example of \(description)---")
    action()
    print()
}

//
// LinkedListChallenges.swift
// Created by Jason Ngo on 2018-09-12.
//        
        
// Challenge 1: Print a given linked list in reverse

/// Prints the linked list in reverse by recursively calling the printInReverse
/// method until the tail nodes is reached. Then prints the node value as the
/// call stack unwinds

public func printInReverse<T: Comparable>(_ linkedList: LinkedList<T>) {
    func printInReverse<T>(_ node: Node<T>?) {
        guard let node = node else { return }
        printInReverse(node.next)
        print(node.value)
    }
    
    printInReverse(linkedList.head)
}

// Challenge 2:

// Given a linked list, return the middle node of the list

/// Returns the middle node by creating two pointers that start at the head node.
/// One pointer is incremented twice as fast as the other until the end of the
/// list has been reached. Once the end has been reached, the slower pointer will
/// reference the middle node

public func getMiddle<T: Comparable>(_ linkedList: LinkedList<T>) -> Node<T>? {
    var slow = linkedList.head
    var fast = linkedList.head
    
    while let nextFast = fast?.next {
        fast = nextFast.next
        slow = slow?.next
    }
    
    return slow
}

// Challenge 3: Reverse a linked list

/// Uncomment the below code and add it as a method to the LinkedList class in the same directory

/// Reverses the list by iterating through the list using 3 pointers: prev, current and next to
/// rearrange the next value of each node to the correct reversed value

//    public mutating func reverse() {
//        var prev = head
//        var current = head?.next
//        prev?.next = nil
//
//        while current != nil {
//            let next = current?.next
//            current?.next = prev
//            prev = current
//            current = next
//        }
//
//        head = prev
//    }

// Challenge 4: Merge two sorted linked lists

/// Takes two lists which are sorted in ascending order and merges them into one list

/// This is accomplished by using two pointers. Point to both lists and iterate
/// through both while comparing the values of each pointer. As we iterate through the lists
/// we set each nodes next value accordingly until we have completed iterated through both lists

public func mergeSorted<T: Comparable>(_ leftList: LinkedList<T>, _ rightList: LinkedList<T>) -> LinkedList<T> {
    guard !leftList.isEmpty else { return rightList } // if list1 is empty return list2
    guard !rightList.isEmpty else { return leftList } // if list2 is empty return list1
    
    var newHead: Node<T>?
    var tail: Node<T>?
    
    var currentLeft = leftList.head
    var currentRight = rightList.head
    
    // check which lists head value is smaller than the other and use the smaller head
    // as the head of the new merged list
    if let leftNode = currentLeft, let rightNode = currentRight {
        if leftNode.value < rightNode.value {
            newHead = leftNode
            currentLeft = leftNode.next
        } else {
            newHead = rightNode
            currentRight = rightNode.next
        }
        tail = newHead
    }
    
    while let leftNode = currentLeft, let rightNode = currentRight {
        if leftNode.value < rightNode.value {
            tail?.next = leftNode
            currentLeft = leftNode.next
        } else {
            tail?.next = rightNode
            currentRight = rightNode.next
        }
        tail = tail?.next
    }
    
    // in the case where some nodes still remain in the either of the lists
    if let leftNodes = currentLeft {
        tail?.next = leftNodes
    }
    
    if let rightNodes = currentRight {
        tail?.next = rightNodes
    }
    
    var list = LinkedList<T>()
    list.head = newHead
    return list
}

/// Another attempt at merging two lists. This merge function is less efficient than the previous one
/// because instead of rearranging the pointers correctly it allocates new Nodes which are appended to
/// the mergedList

public func mergeLists<T: Comparable>(_ list1: LinkedList<T>, list2: LinkedList<T>) -> LinkedList<T> {
    var list1Current = list1.head
    var list2Current = list2.head
    var mergedLinked = LinkedList<T>()
    
    while (list1Current != nil || list2Current != nil) {
        switch (list1Current, list2Current) {
        case let (left?, nil):
            mergedLinked.append(left.value)
            list1Current = list1Current?.next
        case let (nil, right?):
            mergedLinked.append(right.value)
            list2Current = list2Current?.next
        case let (left?, right?):
            if left.value > right.value {
                mergedLinked.append(right.value)
                list2Current = list2Current?.next
            } else {
                mergedLinked.append(left.value)
                list1Current = list1Current?.next
            }
        default:
            fatalError("")
        }
    }
    
    return mergedLinked
}

// Challenge 5: Remove occurences of value from the linked list

/// Uncomment the below code and add it as a method to the LinkedList class in the same directory

//public mutating func removeOccurencesOf(_ value: T) {
// when the value to remove is equal to the head value
//    while let head = head, head.value == value {
//        self.head = head.next
//    }
//
//    var prev = head
//    var current = head?.next
//
//    while let currentNode = current {
// when the current node points to a value to remove change the appropriate next values
//        guard currentNode.value != value else {
//            prev?.next = currentNode.next
//            current = prev?.next
//            continue
//        }
//
//        prev = current
//        current = current?.next
//    }
//}

