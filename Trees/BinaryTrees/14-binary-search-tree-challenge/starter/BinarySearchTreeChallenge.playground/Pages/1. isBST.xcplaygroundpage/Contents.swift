// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

var bst = BinarySearchTree<Int>()
bst.insert(3)
bst.insert(1)
bst.insert(4)
bst.insert(0)
bst.insert(2)
bst.insert(5)

print(bst)


// 1. Create a function that checks if a binary tree is a binary search tree.

func isBST(_ tree: BinarySearchTree<Int>) -> Bool {
    
    // tree with no root is still considered a valid BST
    guard let root = tree.root else { return true }
    
    // Create an array while traversing the tree inOrder
    var treeArray: [Int] = []
    root.traverseInOrder {
        treeArray.append($0)
    }
    
    // Iterate through the array, if it isn't sorted in ascending order than
    // we don't have a valid BST
    for i in 1..<treeArray.count {
        
        let beforeValue = treeArray[i - 1]
        let afterValue = treeArray[i]
        
        if beforeValue > afterValue {
            return false
        }
    }
    
    return true
}

isBST(bst)
