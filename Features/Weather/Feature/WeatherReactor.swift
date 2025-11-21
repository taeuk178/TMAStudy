//
//  WeatherReactor.swift
//  WeatherFeature
//
//  Created by kimtaeuk-N275 on 11/21/25.
//

import Foundation
import ReactorKit
import RxSwift
import WeatherInterface

final public class WeatherReactor: Reactor {
    
    private let fetchWeatherUseCase: FetchWeatherUseCase
    
    public enum Action {
        case fetchWeatherData(lat: Double, lon: Double)
    }
    
    public enum Mutation {
        case setWeatherdata(WeatherData)
    }
    
    public struct State {
        var weatherData: WeatherData?
    }
    
    public var initialState: State = State()
    
    public init(fetchWeatherUseCase: FetchWeatherUseCase) {
        self.fetchWeatherUseCase = fetchWeatherUseCase
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case let .fetchWeatherData(lat, lon):
            return Single<WeatherData>.create { single in
                Task {
                    do {
                        let weatherData = try await self.fetchWeatherUseCase.execute(lat: lat, lon: lon)
                        single(.success(weatherData))
                    } catch {
                        single(.failure(error))
                    }
                }
                return Disposables.create()
            }
            .asObservable()
            .map { Mutation.setWeatherdata($0) }
            .catch { error in
                return .empty()
            }
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case let .setWeatherdata(model):
            newState.weatherData = model
        }
        return newState
    }
}
