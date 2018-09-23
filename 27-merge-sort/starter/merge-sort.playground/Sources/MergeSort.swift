import Foundation

public func mergeSort<T>(_ array: [T]) -> [T] where T: Comparable {
    // recursive base case
    guard array.count > 1 else { return array }
    
    // Divide the array and sort the sub arrays
    let middle = array.count / 2
    let left = mergeSort(Array(array[..<middle]))
    let right = mergeSort(Array(array[middle...]))
    
    // merge the subarrays
    return merge(left, right)
}

private func merge<T>(_ left: [T], _ right: [T]) -> [T] where T: Comparable {
    
    var leftIndex = 0
    var rightIndex = 0
    var result: [T] = []
    
    // iterate through both arrays until one is completed empty
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement < rightElement {
            result.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            result.append(rightElement)
            rightIndex += 1
        } else {
            result.append(leftElement)
            result.append(rightElement)
            leftIndex += 1
            rightIndex += 1
        }
    }
    
    // check if any elements remaining in left array, add if there are
    if leftIndex < left.count {
        result.append(contentsOf: left[leftIndex...])
    }
    
    // check if any elements remaining in right array, add if there are
    if rightIndex < right.count {
        result.append(contentsOf: right[rightIndex...])
    }
    
    return result
}
