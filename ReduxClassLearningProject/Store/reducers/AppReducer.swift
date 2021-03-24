//
//  AppReducer.swift
//  ReduxClassLearningProject
//
//  Created by Jacob LeCoq on 3/23/21.
//

import Foundation

func appReducer(_ state: AppState, _ action: Action) -> AppState {
    var state = state
    
    state.counterState = counterReducer(state.counterState, action)
    state.taskState = taskReducer(state.taskState, action)
    
    return state
}
