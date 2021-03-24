//
//  AddTaskView.swift
//  ReduxClassLearningProject
//
//  Created by Jacob LeCoq on 3/23/21.
//  
//

import SwiftUI

struct AddTaskView: View {
    // MARK: - PROPERTIES

    @EnvironmentObject var store: Store<AppState>
    @State private var title: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    struct Props {
        // MARK: - PROPS
        let tasks: [Task]
        
        // MARK: - DISPATCH
        var onTaskAdded: (Task) -> Void
    }
    
    private func map(state: TaskState) -> Props {
        Props(tasks: state.tasks, onTaskAdded: { task in
            store.dispatch(action: AddTaskAction(task: task))
        })
    }
    
    // MARK: - BODY

    var body: some View {
        let props = map(state: store.state.taskState)
        
        return VStack {
            TextField("Enter task title", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Add"){
                props.onTaskAdded(Task(title: self.title))
            }
            
            List(props.tasks) { task in
                Text(task.title)
            }
            
            Spacer()
        } //: VSTACK
    }
}

// MARK: - PREVIEW

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store(reducer: appReducer, state: AppState())
        return AddTaskView().environmentObject(store)
    }
}
