//
//  Observable.swift
//  RecycleViewProtocol
//
//  Created by Dhiraj Kumar Patil on 25/06/21.
//

import Foundation

public class Observable<T> {
    public var value: T {
        didSet {
            DispatchQueue.main.async {
                self.valueChanged?(self.value)
            }
        }
    }

    private var valueChanged: ((T) -> Void)?

    public init(value: T) {
        self.value = value
    }
    deinit {
        removeObserver()
    }

    /// Add closure as an observer and trigger the closure imeediately if fireNow = true
    public func addObserver(_ onChange: ((T) -> Void)?) {
        valueChanged = onChange
        onChange?(value)
    }

    public func removeObserver() {
        valueChanged = nil
    }

}
