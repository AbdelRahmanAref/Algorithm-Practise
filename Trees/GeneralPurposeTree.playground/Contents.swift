// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

example(of: "depth-first traversal") {
    let tree = makeBeverageTree()
    tree.forEachDepthFirst { print($0.value) }
}

example(of: "level-order traversal") {
    let tree = makeBeverageTree()
    tree.forEachLevelOrder { print($0.value) }
}

example(of: "searching for a node") { // tree from last example
    let tree = makeBeverageTree()
    
    if let searchResult1 = tree.search("ginger ale") {
        print("Found node: \(searchResult1.value)")
    }
    
    if let searchResult2 = tree.search("WKD Blue") {
        print(searchResult2.value)
    } else {
        print("Couldn't find WKD Blue")
    }
}
