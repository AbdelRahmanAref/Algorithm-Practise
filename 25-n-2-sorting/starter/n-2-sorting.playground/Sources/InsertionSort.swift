import Foundation

public func insertionSort<Element>(_ array: inout [Element]) where Element: Comparable {
    // no need to sort collection of less than 2 items
    guard array.count >= 2 else {
        return
    }
    
    // iterate left to right once
    for current in 1..<array.count {
        // run backwards from the current index to the start index
        // to shift left if needed
        for shifting in (1...current).reversed() {
            // if unable to shift, break out of the loop
            if array[shifting] < array[shifting - 1] {
                array.swapAt(shifting, shifting - 1)
            } else {
                break
            }
        }
    }
}

// Generalized version
public func insertionSort<T>(_ collection: inout T) where T: BidirectionalCollection & MutableCollection, T.Element: Comparable {
    
    guard collection.count >= 2 else { return }
    
    for current in collection.indices {
        var shifting = current
        
        while shifting > collection.startIndex {
            let previous = collection.index(before: shifting)
            
            if collection[shifting] < collection[previous] {
                collection.swapAt(shifting, previous)
            } else {
                break
            }
            
            shifting = previous
        }
    }
}
