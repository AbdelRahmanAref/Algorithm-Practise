//: Playground - noun: a place where people can play

import Cocoa

example(of: "printing in reverse") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("Original list: \(list)")
    print("Printing in reverse:")
    printInReverse(list)
}

example(of: "printing middle node") {
    var list = LinkedList<Int>()
    list.push(4)
    list.push(3)
    list.push(2)
    list.push(1)
    print("Original list: \(list)")

    if let middleNode = getMiddle(list) {
        print("Middle node: \(middleNode)")
    }
}

example(of: "Reversing a linked list") {
    var list = LinkedList<Int>()
    list.push(4)
    list.push(3)
    list.push(2)
    list.push(1)

    print("Original list: \(list)")
    list.reverse()
    print("Reversed list: \(list)")
}

example(of: "merged") {
    var list1 = LinkedList<Int>()
    var list2 = LinkedList<Int>()

    list1.push(11)
    list1.push(10)
    list1.push(4)
    list1.push(1)
    print("\(list1)")

    list2.push(6)
    list2.push(3)
    list2.push(2)
    list2.push(-1)
    print("\(list2)")

    let mergedSort = mergeSorted(list1, list2)
    print("Merged List: \(mergedSort)")
}

example(of: "remove occurrences") {
    var list = LinkedList<Int>()
    list.push(5)
    list.push(4)
    list.push(3)
    list.push(3)
    list.push(3)
    list.push(1)

    print("Original list: \(list)")
    let value = 5
    list.removeOccurencesOf(value)
    print("Removed: \(value) from list: \(list)")
}
