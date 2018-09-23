// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

var priorityQueue = PriorityQueue(sort: >, elements: [1,12,3,4,1,6,8,7])

while !priorityQueue.isEmpty {
    print(priorityQueue.dequeue()!)
}

print("\n")

var priorityQueue2 = PrioityQueueArray(sort: <, array: [1,12,3,4,1,6,8,7])

while !priorityQueue2.isEmpty {
    print(priorityQueue2.dequeue()!)
}
