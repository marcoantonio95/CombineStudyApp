//
//  CombineStudyAppTests.swift
//  CombineStudyAppTests
//
//  Created by Marco Antonio Oliveira on 01/03/23.
//

import XCTest
import RxCocoa
import RxSwift
import Combine

@testable import CombineStudyApp

class CombineStudyAppTests: XCTestCase {
    let iterations = 10000

    func test_publishSubject_sum_operation_rxSwift() {
        measure {
            var sum = 0
            let subject = PublishSubject<Int>()

            let subscription = subject
                .subscribe(onNext: { x in
                    sum += x
                })

            for _ in 0 ..< iterations * 100 {
                subject.on(.next(1))
            }

            subscription.dispose()

            XCTAssertEqual(sum, iterations * 100)
        }
    }

    func test_publishSubject_sum_operation_combine() {
           measure {
               var sum = 0
               let subject = PassthroughSubject<Int, Never>()

               let subscription = subject
                   .sink(receiveValue: { x in
                       sum += x
                   })

               for _ in 0 ..< iterations * 100 {
                   subject.send(1)
               }

               subscription.cancel()

               XCTAssertEqual(sum, iterations * 100)
           }
       }

    func test_two_publishSubject_sum_operation_rxSwift() {
            measure {
                var sum = 0
                let subject = PublishSubject<Int>()

                let subscription1 = subject
                    .subscribe(onNext: { x in
                        sum += x
                    })

                let subscription2 = subject
                    .subscribe(onNext: { x in
                        sum += x
                    })

                for _ in 0 ..< iterations * 100 {
                    subject.on(.next(1))
                }

                subscription1.dispose()
                subscription2.dispose()

                XCTAssertEqual(sum, iterations * 100 * 2)
            }
        }

    func test_two_publishSubject_sum_operation_combine() {
            measure {
                var sum = 0
                let subject = PassthroughSubject<Int, Never>()

                let subscription1 = subject
                    .sink(receiveValue: { x in
                        sum += x
                    })

                let subscription2 = subject
                    .sink(receiveValue: { x in
                        sum += x
                    })

                for _ in 0 ..< iterations * 100 {
                    subject.send(1)
                }

                subscription1.cancel()
                subscription2.cancel()

                XCTAssertEqual(sum, iterations * 100 * 2)
            }
        }
}
