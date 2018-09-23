import Foundation

public func selectionSort<Element>(_ array: inout [Element]) where Element: Comparable {
    
    // no need to sort array of less than two values
    guard array.count >= 2 else {
        return
    }
    
    // iterate through all elements except the last one
    // by the end of all the passes the last element
    // will be in the correct spot
    for current in 0..<(array.count - 1) {
        var lowest = current
        // every pass, go through the remainder of elements
        // to find the element with the lowest value
        for other in (current + 1)..<(array.count) {
            if array[lowest] > array[other] {
                lowest = other
            }
        }
        
        // if not the current element than swap them
        if lowest != current {
            array.swapAt(lowest, current)
        }
    }
}

// Generalized version
public func selectionSort<T>(_ collection: inout T) where T: MutableCollection, T.Element: Comparable {
    
    guard collection.count >= 2 else { return }
    
    for current in collection.indices {
        var lowest = current
        var other = collection.index(after: current)
        
        while other < collection.endIndex {
            if collection[lowest] > collection[other] {
                lowest = other
            }
            other = collection.index(after: other)
        }
        
        if lowest != current {
            collection.swapAt(lowest, current)
        }
    }
    
}
