import Foundation

public func example(of description: String, action: () -> ()) {
    print("---Example of \(description)---")
    action()
    print()
}

// Challenge 1: Print a linked list in reverse not recursively

/// This can be accomplished by iterating through the list and pushing each value
/// onto the stack. Once the list has been fully traversed than we can print the
/// values as we pop values off the stack

public func printInReverse<T>(_ list: LinkedList<T>) {
    var current = list.head
    var stack = Stack<T>()

    while let node = current {
        stack.push(node.value)
        current = current.next
    }

    while let value = stack.pop() {
        print(value)
    }
}

// Challenge 2: Given a string, check if the parenthesis are correctly balanced

/// This is accomplished by using a stack to keep track of '('. As we iterate
/// through the string we push '(' onto the stack. Whenever we encounter ')'
/// than we pop a '(' off the stack. If we can't pop anything off the stack while
/// ')' still exist than return false. Other return if the stack is empty at
/// at the end of iterating through the string

public func checkBalancedParenthesis(_ string: String) -> Bool {
    var stack = Stack<Character>()
    
    for char in string {
        if char == "(" {
            stack.push(char)
        } else if char == ")" {
            if stack.isEmpty {
                return false
            } else {
                stack.pop()
            }
        }
    }
    
    return stack.isEmpty
}
