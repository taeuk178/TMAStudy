//
//  CounterReactor.swift
//  CounterFeature
//
//  Created by kimtaeuk-N275 on 11/21/25.
//

import Foundation
import ReactorKit

public final class CounterReactor: Reactor {
    
    public enum Action {
        case increase
        case decrease
    }
    
    public enum Mutation {
        case increaseCount
        case decreaseCount
        
    }
    
    public struct State {
        var indexCount: Int = 0
    }
    
    public var initialState: State = State()
    
    public init() {
        
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .increase:
            return .just(.increaseCount)
        case .decrease:
            return .just(.decreaseCount)
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .increaseCount:
            newState.indexCount += 1
        case .decreaseCount:
            newState.indexCount -= 1
        }
        return newState
    }
}
