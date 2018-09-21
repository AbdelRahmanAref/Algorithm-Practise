import Foundation

public class Trie<CollectionType: Collection & Hashable> where CollectionType.Element: Hashable {
    
    public typealias Node = TrieNode<CollectionType.Element>
    
    private let root = Node(key: nil, parent: nil)
    
    public init() {}
    
    public func insert(_ collection: CollectionType) {
        
        // start at the root
        var current = root
        
        // iterate through each element of the collection
        for element in collection {
            
            // if the current pointers children doesn't contain the element
            // add the element to current's children
            if current.children[element] == nil {
                current.children[element] = Node(key: element, parent: current)
            }
            current = current.children[element]!
        }
        
        current.isTerminating = true
    }
    
    public func contains(_ collection: CollectionType) -> Bool {
        
        // start at the root
        var current = root
        
        // iterate through each element of the collection
        for element in collection {
            // if the current node's children array doesn't contain a value
            // for the element key, than it doesn't exist in the trie
            guard let child = current.children[element] else {
                return false
            }
            
            current = child
        }
        
        // if the last value isn't terminating than we haven't found a word
        return current.isTerminating
    }
    
    public func remove(_ collection: CollectionType) {
        // start at the root
        var current = root
        
        // iterate through the elements of the collection to reach terminating node
        for element in collection {
            // if an element of the collection doesn't exist in the current node exit
            guard let child = current.children[element] else { return }
            current = child
        }
        
        // if current doesn't point to a terminating node than the word isn't in the collection
        guard current.isTerminating else {
            return
        }
        
        // set the current node as not terminating
        current.isTerminating = false
        
        // iterate through the parents of the removed node
        while let parent = current.parent,
            current.children.isEmpty && !current.isTerminating {
                parent.children[current.key!] = nil
                current = parent
        }
    }
}

public extension Trie where CollectionType: RangeReplaceableCollection {
    
    func collections(startingWith prefix: CollectionType) -> [CollectionType] {
        // first ensure that the prefix exists in the trie
        
        // start at the root
        var current = root
        
        // iterate through the elements of the prefix
        for element in prefix {
            guard let child = current.children[element] else { return [] }
            current = child
        }
        
        // determined that prefix does exist in trie
        return collections(startingWith: prefix, after: current)
    }
    
    // helper function that returns all the collections after the specified node
    private func collections(startingWith prefix: CollectionType, after node: Node) -> [CollectionType] {
        
        var results: [CollectionType] = []
        
        // if the current node is terminating add it to the results
        if node.isTerminating {
            results.append(prefix)
        }
        
        // iterate through all the children of the current node to create new prefixes
        // and recursively search with newprefixes for more terminating nodes
        for child in node.children.values {
            var newPrefix = prefix
            newPrefix.append(child.key!)
            
            results.append(contentsOf: collections(startingWith: newPrefix, after: child))
        }
        
        return results
    }
}
