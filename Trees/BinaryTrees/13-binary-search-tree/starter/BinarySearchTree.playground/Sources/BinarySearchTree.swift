import Foundation

public struct BinarySearchTree<Element: Comparable> {
    
    public private(set) var root: BinaryNode<Element>?
    
    public init() {}

}

// MARK: - Insert
extension BinarySearchTree {
    public mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    
    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
        guard let node = node else {
            return BinaryNode(value: value)
        }
        
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        
        return node
    }
}

// MARK: - Search
extension BinarySearchTree {
    public func contains(_ value: Element) -> Bool {
        // set current to root node
        var current = root
        
        // continue search while we can still unwrap current ptr
        while let node = current {
            // If the current nodes value equals the search value return true
            if node.value == value {
                return true
            }
            
            // compare values to check which sub-tree you should search through
            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        
        return false
    }
}

// MARK: - Removal
private extension BinaryNode {
    // Iterates through a node's left childs until we reach the left most node
    var min: BinaryNode {
        return leftChild?.min ?? self
    }
    
    var isLeaf: Bool {
        return leftChild == nil && rightChild == nil
    }
}

extension BinarySearchTree {
    
    public mutating func remove(_ value: Element) {
        root = remove(from: root, value: value)
    }
    
    private func remove(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
        guard let node = node else { return nil }
        
        if value == node.value {
            // if node is a leaf remove it
            if node.isLeaf { return nil }
            
            // if left child is empty return the right child
            if node.leftChild == nil { return node.rightChild }
            // if right child is empty return the left child
            if node.rightChild == nil { return node.leftChild }
            
            // set node to remove's value to the value of the left most node of the right subtree
            node.value = node.rightChild!.min.value
            // remove the leftmost node from the right subtree
            node.rightChild = remove(from: node.rightChild, value: node.value)
        } else if value < node.value {
            node.leftChild = remove(from: node.leftChild, value: value)
        } else {
            node.rightChild = remove(from: node.rightChild, value: value)
        }
        
        return node
    }
}



extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        guard let root = root else { return "empty tree" }
        return String(describing: root)
    }
}
