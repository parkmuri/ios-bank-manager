//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 리지, 무리 on 2023/03/07.
//

import Foundation

struct Bank {
    private var waitingLine = Queue<Client>()
    private var clientCount: Int = 10
    private var bankClerkCount: Int = 1
    var bankClerk = BankClerk()
    
    mutating func lineUpClient() {
        clientCount = Int.random(in: 10...30)
        for number in 1...clientCount {
            let client = Client(number: number)
            waitingLine.enqueue(client)
        }
    }
    
    mutating func doTask() {
        let startTime = CFAbsoluteTimeGetCurrent()

        for _ in 1...waitingLine.count {
            guard let currentClient = waitingLine.dequeue() else { return }
            bankClerk.service(to: currentClient)
        }
        
        let timeOfTask = CFAbsoluteTimeGetCurrent() - startTime
        let totalTime = String(format: "%.2f", floor(timeOfTask))
        let success = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clientCount)명이며, 총 업무시간은 \(totalTime)초입니다."
        print(success)
    }
}
