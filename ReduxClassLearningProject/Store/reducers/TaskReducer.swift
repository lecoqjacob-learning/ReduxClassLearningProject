//
//  TaskReducer.swift
//  ReduxClassLearningProject
//
//  Created by Jacob LeCoq on 3/23/21.
//

import Foundation

func taskReducer(_ state: TaskState, _ action: Action) -> TaskState {
    var state = state
    
    switch action {
    case let action as AddTaskAction:
        state.tasks.append(action.task)
    default:
        break
    }
    
    return state
}
