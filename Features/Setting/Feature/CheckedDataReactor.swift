//
//  CheckedDataReactor.swift
//  SettingFeature
//
//  Created by taeuk on 11/23/25.
//

import Foundation
import ReactorKit

final class CheckedDataReactor: Reactor {
    
    enum Action {
        
    }
    
    enum Mutation {
        
    }
    
    struct State {
        
    }
    
    var initialState: State = State()
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
            
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
            
        }
        return newState
    }
}
