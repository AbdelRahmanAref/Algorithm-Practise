import Foundation

public func bubbleSort<Element>(_ array: inout [Element]) where Element: Comparable {
    
    // don't need to sort if less than 2 elements
    guard array.count >= 2 else {
        return
    }
    
    // every pass of bubble pass allows us to ignore
    // 1 element as it should be in the correct spot
    // this allows us to iterate through less elements every pass
    for end in (1..<array.count).reversed() {
        var swapped = false
        
        // iterate through elements swapping if needed
        for current in 0..<end {
            if array[current] > array[current + 1] {
                array.swapAt(current, current + 1)
                swapped = true
            }
        }
        
        // if no values were swapped the sorting is done
        if !swapped {
            return
        }
    }
    
}

// Generalized version
public func bubbleSort<T>(_ collection: inout T) where T: MutableCollection, T.Element: Comparable {
    
    guard collection.count >= 2 else {
        return
    }
    
    for end in collection.indices.reversed() {
        var swapped = false
        var current = collection.startIndex
        
        while current < end {
            let next = collection.index(after: current)
            
            if collection[current] > collection[next] {
                collection.swapAt(current, next)
                swapped = true
            }
            
            current = next
        }
        
        if !swapped { return }
    }
}
