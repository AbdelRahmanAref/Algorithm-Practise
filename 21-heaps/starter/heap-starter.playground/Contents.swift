// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

var heap = Heap(sort: >, elements: [1,12,3,4,1,6,8,7])

while !heap.isEmpty {
    print(heap.remove()!)
}
