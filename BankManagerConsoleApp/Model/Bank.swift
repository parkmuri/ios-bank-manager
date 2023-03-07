//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 리지, 무리 on 2023/03/07.
//

import Foundation

struct Bank {
    var clientList = Queue<Int>()
    
    mutating func lineUpClient() {
        let client = Client()
        print(client.number)
        
        for number in 1...client.number {
            clientList.enqueue(number)
        }
    }

    mutating func serviceToClient() {
        let checkTime = CFAbsoluteTimeGetCurrent()

        for _ in 1...clientList.count {
            guard let now = clientList.dequeue() else { return }
            print("\(now)번째 고객 업무 처리 시작")
            usleep(700000)
            print("\(now)번째 고객 업무 처리 종료")
        }

        let timeOfTask = CFAbsoluteTimeGetCurrent() - checkTime
        print("업무수행시 걸린 시간 \(timeOfTask)초")
    }
}
