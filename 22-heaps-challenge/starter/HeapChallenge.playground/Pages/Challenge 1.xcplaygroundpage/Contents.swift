/*:
 # Challenge 1
 
 Write a function to find the `nth` smallest integer in an unsorted array. For example:
 
 ```
 let integers = [3, 10, 18, 5, 21, 100]
 ```
 If  `n = 3`, the result should be `10`.
 */
// Take advantage of the min heap property that the root is always the smallest
// element. Remove n items from the heap until we find the desired integer
func getNthSmallestElement(n: Int, elements: [Int]) -> Int? {
    
    var heap = Heap(sort: <, elements: elements) // min heap

    var count = 1
    
    while !heap.isEmpty {
        let root = heap.remove()
        if count == n {
            return root
        }
        count += 1
    }
    
    // after removing all elements of heap, when the count hasn't been met,
    // than the element doesn't exist in the heap and should return nil
    return nil
}
//: [Next](@next)
