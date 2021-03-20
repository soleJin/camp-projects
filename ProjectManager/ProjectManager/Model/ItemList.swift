//
//  ItemList.swift
//  ProjectManager
//
//  Created by 김동빈 on 2021/03/12.
//

import Foundation

protocol ItemListUpdateDelegate: AnyObject {
    func insertRow(at index: Int)
    func deleteRow(at index: Int)
    func updateRow(at index: Int)
}

class ItemList {
    static let shared = ItemList()
    private init() {}

    weak var todoDelegate: ItemListUpdateDelegate?
    weak var doingDelegate: ItemListUpdateDelegate?
    weak var doneDelegate: ItemListUpdateDelegate?
    
    private var todoList = [Todo]()
    private var doingList = [Todo]()
    private var doneList = [Todo]()
    
    func countListItem(statusType: ItemStatus) -> Int {
        switch statusType {
        case .todo:
            return todoList.count
        case .doing:
            return doingList.count
        case .done:
            return doneList.count
        }
    }
    
    func getItem(statusType: ItemStatus, index: Int) -> Todo {
        switch statusType {
        case .todo:
            return todoList[index]
        case .doing:
            return doingList[index]
        case .done:
            return doneList[index]
        }
    }
    
    func removeItem(statusType: ItemStatus, index: Int) {
        switch statusType {
        case .todo:
            todoList.remove(at: index)
            todoDelegate?.deleteRow(at: index)
        case .doing:
            doingList.remove(at: index)
            doingDelegate?.deleteRow(at: index)
        case .done:
            doneList.remove(at: index)
            doneDelegate?.deleteRow(at: index)
        }
    }
    
    func insertItem(statusType: ItemStatus, index: Int = 0, item: Todo)  {
        switch statusType {
        case .todo:
            todoList.insert(item, at: index)
            todoDelegate?.insertRow(at: index)
        case .doing:
            doingList.insert(item, at: index)
            doingDelegate?.insertRow(at: index)
        case .done:
            doneList.insert(item, at: index)
            doneDelegate?.insertRow(at: index)
        }
    }
    
    func updateItem(statusType: ItemStatus, index: Int, item: Todo) {
        switch statusType {
        case .todo:
            todoList[index] = item
            todoDelegate?.updateRow(at: index)
        case .doing:
            doingList[index] = item
            doingDelegate?.updateRow(at: index)
        case .done:
            doneList[index] = item
            doneDelegate?.updateRow(at: index)
        }
    }
}
