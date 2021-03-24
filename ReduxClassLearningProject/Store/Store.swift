//
//  Store.swift
//  HelloRedux
//
//  Created by Mohammad Azam on 9/14/20.
//

import Foundation

typealias Dispatcher = (Action) -> Void

typealias Reducer<State: ReduxState> = (_ state: State, _ action: Action) -> State
typealias Middleware<StoreState: ReduxState> = (StoreState, Action, @escaping Dispatcher) -> Void

protocol ReduxState { }

struct AppState: ReduxState {
    var counterState = CounterState()
    var taskState = TaskState()
}

struct TaskState: ReduxState {
    var tasks: [Task] = [Task]()
}

struct CounterState: ReduxState {
    var counter = 0
}

class Store<StoreState: ReduxState>: ObservableObject {
    
    var reducer: Reducer<StoreState>
    var middleware: [Middleware<StoreState>]
    @Published var state: StoreState
    
    init(reducer: @escaping Reducer<StoreState>, state: StoreState, middleware: [Middleware<StoreState>] = []) {
        self.reducer = reducer
        self.state = state
        self.middleware = middleware
    }
    
    func dispatch(action: Action) {
        DispatchQueue.main.async {
            self.state = self.reducer(self.state, action)
        }
        
        // run all middleware funcs
        
        middleware.forEach { middleware in
            middleware(state, action, dispatch)
        }
    }
    
}
