//
//  IncrementAsyncMiddleware.swift
//  ReduxClassLearningProject
//
//  Created by Jacob LeCoq on 3/24/21.
//

import Foundation

func incrementAsyncMiddleware() -> Middleware<AppState> {
    return { state, action, dispatch in
        switch action {
        case _ as IncrementActionAsync:
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                dispatch(IncrementAction())
            }
        default:
            break
        }
    }
}
