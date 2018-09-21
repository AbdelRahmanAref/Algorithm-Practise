// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public func example(of description: String, action: () -> Void) {
    print("---Example of \(description)---")
    action()
    print()
}

public func heightOf<T>(_ node: BinaryNode<T>?) -> Int {
    guard let node = node else {
        return -1
    }
    
    return 1 + max(heightOf(node.leftChild), heightOf(node.rightChild))
}

