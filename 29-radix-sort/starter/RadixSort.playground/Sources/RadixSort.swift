import Foundation

extension Array where Element == Int {
    
    // LSD radix sort
    public mutating func radixSort() {
        let base = 10
        var done = false
        var digits = 1
        
        // bucket sort
        while !done {
            done = true
            
            // create a 2d array to use for buckets
            var buckets: [[Int]] = .init(repeating: [], count: base)
            
            // iterate through each number, placing it in the correct bucket
            forEach { (number) in
                let remainingPart = number / digits
                let digit = remainingPart % base
                print("remainingPart: \(remainingPart), digit: \(digit)")
                buckets[digit].append(number)
                
                if remainingPart > 0 {
                    done = false
                }
            }
            
            // update digits to inspect the next digit
            digits *= base
            // flatmap returns a 1d array created using a 2d array
            self = buckets.flatMap { $0 }
        }
    }
    
}
