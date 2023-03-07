//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 리지, 무리 on 2023/03/07.
//

import Foundation

struct Bank {
    private var waitingLine = Queue<Int>()

    mutating func lineUpClient() {
        let client = Client()
        print(client.number)
        
        for number in 1...client.number {
            waitingLine.enqueue(number)
        }
    }
    
    mutating func serviceToClient() {
        let startTime = CFAbsoluteTimeGetCurrent()

        for _ in 1...waitingLine.count {
            guard let now = waitingLine.dequeue() else { return }
            let start = "\(now)번 고객 업무 시작"
            let end = "\(now)번 고객 업무 완료"
            
            print(start)
            usleep(700000)
            print(end)
        }
        
        let timeOfTask = CFAbsoluteTimeGetCurrent() - startTime
        let totalTime = String(format: "%.2f", floor(timeOfTask))
        let success = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(waitingLine.count)명이며, 총 업무시간은 \(totalTime)초입니다."
        print(success)
    }
}
