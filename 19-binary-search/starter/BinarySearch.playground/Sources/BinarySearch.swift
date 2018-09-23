import Foundation

// 1.
public extension RandomAccessCollection where Element: Comparable {
    func binarySearch(for value: Element, in range: Range<Index>? = nil) -> Index? {
        // check if range is nil. if it is range will cover entire collection
        let range = range ?? startIndex..<endIndex
        // ensure range has atleast one element
        guard range.lowerBound < range.upperBound else { return nil }
        // find middle index
        let size = distance(from: range.lowerBound, to: range.upperBound)
        let middle = index(range.lowerBound, offsetBy: size / 2)
        // check if middle is correct value
        // otherwise recursively call binarySearch on other ranges
        if self[middle] == value {
            return middle
        } else if self[middle] > value {
            return binarySearch(for: value, in: range.lowerBound..<middle)
        } else {
            return binarySearch(for: value, in: middle..<range.upperBound)
        }
    }
    
    func findIndices(of value: Element, in collection: Self) -> Range<Index>? {
        // value doesn't exist in collection
        guard let binarySearchIndex = binarySearch(for: value) else { return nil }
        
        var startIndex = collection.startIndex
        var endIndex = collection.index(after: binarySearchIndex)
        
        // increment the starting index
        while startIndex < binarySearchIndex {
            if collection[startIndex] == value { break }
            startIndex = collection.index(after: startIndex)
        }
        
        while endIndex < collection.endIndex {
            if collection[endIndex] != value { break }
            endIndex = collection.index(after: endIndex)
        }
        
        return Range(uncheckedBounds: (lower: startIndex, upper: endIndex))
    }
}
