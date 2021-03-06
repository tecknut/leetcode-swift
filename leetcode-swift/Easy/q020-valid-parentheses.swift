//
//  q020-valid-parentheses.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/valid-parentheses/
//  Category* :  Stack
//
//  Created by Tianyu Wang on 16/7/5.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Given a string containing just the characters '(', ')', '{', '}', '[' and ']',
 * determine if the input string is valid.
 *
 * The brackets must close in the correct order, "()" and "()[]{}" are all valid
 * but "(]" and "([)]" are not.
 *
 **********************************************************************************/


import Foundation

struct q20 {
    
    class Solution {
        func isValid(_ s: String) -> Bool {
            let rule = Array("()[]{}".characters)
            var stack = [Character]()
            for (_, char) in s.characters.enumerated() {
                if rule.index(of: char)! % 2 == 0 {    // open brackets
                    stack.append(char)
                } else {                            // close brackets
                    if stack.isEmpty {
                        return false
                    } else {
                        if rule.index(of: char)! - rule.index(of: stack.last!)! == 1 {  //barckets matched
                            stack.removeLast()
                        } else {
                            return false
                        }
                    }
                }
            }
            return stack.isEmpty
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().isValid("(("))
        print(Solution().isValid("(])"))
        print(Solution().isValid("([{}])"))
        print(Solution().isValid("()[]{}"))
        print(Solution().isValid("([{)]}"))

 
    }
}
