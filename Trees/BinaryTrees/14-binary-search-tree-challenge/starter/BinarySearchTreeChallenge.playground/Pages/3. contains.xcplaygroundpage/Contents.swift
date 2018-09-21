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

var bst2 = BinarySearchTree<Int>()
bst2.insert(2)
bst2.insert(5)
bst2.insert(3)
bst2.insert(1)
bst2.insert(0)
// bst2.insert(100)
print(bst2)


// 3. Create a method that checks if the current tree contains all the elements of another tree
// leftTree represents the current tree
func contains(_ leftTree: BinarySearchTree<Int>, _ rightTree: BinarySearchTree<Int>) -> Bool {
    
    // Creating a dictionary representing the rightTree
    var treeElements: [Int: Bool] = [:]
    rightTree.root?.traversePreOrder {
        treeElements[$0] = false
    }
    
    // Traverse through left tree. If value found that matches second tree set
    // dictionary value to true
    leftTree.root?.traversePreOrder {
        if let _ = treeElements[$0] {
            treeElements[$0] = true
        }
    }
    
    // Iterate through the dictionary values. If false found than the left tree
    // doesn't contain values from the right tree
    for (_, value) in treeElements {
        if value == false {
            return false
        }
    }
    
    return true
}

contains(bst, bst2)
