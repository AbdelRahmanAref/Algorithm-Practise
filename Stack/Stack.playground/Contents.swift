import Cocoa

example(of: "using a stack") {
    var stack = Stack<Int>()

    stack.push(1)
    stack.push(2)
    stack.push(3)
    stack.push(4)

    print(stack)

    if let poppedElement = stack.pop() {
        assert(4 == poppedElement)
        print("Popped: \(poppedElement)")
    }
}

example(of: "initializing a stack from an array") {
    let array = ["H", "e", "l", "l", "o"]
    var stack = Stack(array)
    print(stack)
    stack.pop()
    
    checkBalancedParenthesis("(Hello))")
}

example(of: "initializing a stack from an array literal") {
    var stack: Stack = [1.0, 2.0, 3.0, 4.0]
    print(stack)
    stack.pop()
}

example(of: "balanced parenthesis") {
    let testString = "(Hello)"
    checkBalancedParenthesis(testString)
    
    let testString2 = "(Hello"
    checkBalancedParenthesis(testString2)
    
    let testString3 = "Hello"
    checkBalancedParenthesis(testString3)
    
    let testString4 = "func (tuple: (world, foobar))"
    checkBalancedParenthesis(testString4)
}


