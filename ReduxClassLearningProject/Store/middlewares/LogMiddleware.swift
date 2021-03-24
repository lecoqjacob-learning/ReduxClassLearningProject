//
//  LogMiddleware.swift
//  ReduxClassLearningProject
//
//  Created by Jacob LeCoq on 3/24/21.
//

import Foundation

func logMiddleware() -> Middleware<AppState> {
    
    return { state, action, dispatch in
        print("LOG MIDDLEWARE")
    }
}
