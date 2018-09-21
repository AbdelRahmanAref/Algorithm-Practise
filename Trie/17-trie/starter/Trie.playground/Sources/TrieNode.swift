import Foundation

public class TrieNode<Key: Hashable> {
    
    // holds data for node. Optional since root is nil
    public var key: Key?
    
    public weak var parent: TrieNode?
    
    // Trie node has more than 2 children
    public var children: [Key: TrieNode] = [:]
    
    public var isTerminating = false
    
    public init(key: Key?, parent: TrieNode?) {
        self.key = key
        self.parent = parent
    }
    
}
