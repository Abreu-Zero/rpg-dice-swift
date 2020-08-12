//
//  LinkedList.swift
//  RpgDice
//
//  Created by Henrique Abreu on 12/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//
// Special thanks to Chris Pilcher and  Matthijs Hollemans for the tutorial on Linked Lists!

import Foundation

public class LinkedList {
    public var head: Node?
    public var tail: Node?
    
    public func append(node: Node) {
        let newNode = node
        if let tailNode = tail {
        tailNode.next = newNode
        }
        else {
            head = newNode
        }
        tail = newNode
    }
    
    public func count() -> Int{
        var i = 0
        var node = head
          while node != nil {
            node = node?.next
            i += 1
        }
        return i
    }
    
    public func index(index: Int) -> Node? {
      if index >= 0 {
        var node = head
        var i = index
        while node != nil {
          if i == 0 { return node }
          i -= 1
          node = node!.next
        }
      }
      return nil
    }
}
public class Node{
    var next: Node?
    let value: DndAPI.Endpoint
    let title: String
    
    init(value: DndAPI.Endpoint, title: String) {
        self.value = value
        self.title = title
    }
}
