import Foundation

public class TreeNode<T: Comparable> {
    public var value: T
    var children: [TreeNode] = []
    
    public init (_ value: T) {
        self.value = value
    }
    
    public func add(_ node: TreeNode) {
        children.append(node)
    }
}

extension TreeNode {
    public func forEachDepthFirst(visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach {
            $0.forEachDepthFirst(visit: visit)
        }
    }
    
    public func forEachLevelOrder(visit: (TreeNode) -> Void) {
        visit(self)
        var queue = Queue<TreeNode>()
        children.forEach { queue.enqueue($0) }
        print("\n")
        
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach { queue.enqueue($0) }
        }
    }
    
    public func search(_ value: T) -> TreeNode? {
        var result: TreeNode?
        
        forEachLevelOrder {
            if $0.value == value {
                result = $0
            }
        }
        
        return result
    }
}
