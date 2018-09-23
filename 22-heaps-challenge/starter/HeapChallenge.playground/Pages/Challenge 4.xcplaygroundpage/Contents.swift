//: [Previous](@previous)
/*:
 # Challenge 4
 
 Write a function to check if a given array is a min heap.
 */
func leftChildIndex(ofParentAt index: Int) -> Int {
    return (2 * index) + 1
}

func rightChildIndex(ofParentAt index: Int) -> Int {
    return (2 * index) + 2
}

// iterate through the non-leaf values and check if the
// children of each node satisfy the heap requirements.
func isMinHeap<Element: Comparable>(elements: [Element]) -> Bool {
    guard !elements.isEmpty else {
        return true
    }
    
    // stride: iterates from elements.count / 2 - 1 to 0
    for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
        let left = leftChildIndex(ofParentAt: i)
        if elements[left] < elements[i] {
            return false
        }
        
        let right = rightChildIndex(ofParentAt: i)
        if elements[right] < elements[i] {
            return false
        }
    }
    
    return true
}
