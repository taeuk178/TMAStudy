//
//  RouteType.swift
//  TMAShared
//
//  모든 Feature Route의 공통 마커 프로토콜
//

import Foundation

/// 모든 Feature Route가 준수해야 하는 마커 프로토콜
/// MainCoordinator가 다형성을 통해 여러 Feature Route를 처리하기 위해 사용
public protocol RouteType: Equatable {}
