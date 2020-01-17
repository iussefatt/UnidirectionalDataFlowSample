//
//  Rx+MappingModels.swift
//  Test
//
//  Created by Ismael Ussefatt on 23/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import RxSwift
import ObjectMapper

extension ObservableType {

    func cast<T>(to type: T.Type) -> Observable<T> {
        return map { input -> T in
            guard let output = input as? T else {
                throw NSError(domain: "Cast fail", code: 1, userInfo: nil)
            }
            return output
        }
    }
}

extension Observable where Element == [Any] {

    /// map an array of JSON objects  aka `[Any]` into an array of `ImmutableMappable` model from ObjectMapper
    /// - parameters:
    ///     - type: The model type to be mapped
    ///     - throwsOnSingleFail: Since it's being mapped an array, when this value is  `false`,
    ///      the mapping will NOT throws an error if a single object fails.
    ///      If this value is `true`, any object of JSON array that faills will be enough to fail all the operation
    func mapModel<M: ImmutableMappable>(to type: M.Type, throwsOnSingleFail: Bool) -> Observable<[M]> {
        return map { jsonArray in
            if throwsOnSingleFail {
                return try jsonArray.map { try M(JSONObject: $0) }
            }
            return jsonArray.compactMap { try? M(JSONObject: $0) }
        }
    }
}


extension Observable where Element == Any {

    /// map a JSON object aka `Any` into an array of `ImmutableMappable` model from ObjectMapper
    func mapModel<Model: ImmutableMappable>(to type: Model.Type) -> Observable<Model> {
        return map { try Model(JSONObject: $0) }
    }
}
