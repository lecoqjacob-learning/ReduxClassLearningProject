//
//  CounterAction.swift
//  ReduxClassLearningProject
//
//  Created by Jacob LeCoq on 3/23/21.
//

import Foundation

struct IncrementAction: Action { }
struct DecrementAction: Action { }
struct AddAction: Action { let value: Int }

struct IncrementActionAsync: Action { }
