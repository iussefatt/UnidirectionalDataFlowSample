//
//  RequestProvider.swift
//  Test
//
//  Created by Ismael Ussefatt on 23/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import RxSwift
import Alamofire

final class RequestProvider<T: TargetType> {
    
    private func request(from target: T) -> DataRequest {
        return AF.request(
            target.url.appendingPathComponent(target.path),
            method: target.method,
            parameters: target.task.parameters,
            encoding: target.task.enconding,
            headers: target.headers,
            interceptor: nil
        )
    }
    
    func request(_ target: T) -> Observable<Any> {
        Observable.create { [weak self] observer in
            guard let self = self else { return Disposables.create() }
            let request = self.request(from: target)
            request.responseJSON { response in
                do {
                    let jsonObject = try response.result.get()
                    observer.onNext(jsonObject)
                    observer.onCompleted()
                } catch(let error) {
                    observer.onError(error)
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
