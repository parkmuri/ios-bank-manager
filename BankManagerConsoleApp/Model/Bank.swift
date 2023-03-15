//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 리지, 무리 on 2023/03/08.
//

import Foundation

struct Bank {
    var waitingLine = Queue<Client>()
    var clientCount: Int = 0
    private var bankClerk = BankClerk()
    private let typeOfTask: [Task] = [.deposit, .loan]
    private let loanBankClerk = DispatchSemaphore(value: 1)
    private let depositBankClerks = DispatchSemaphore(value: 2)
    private let taskGroup = DispatchGroup()
    var delegate: BankDelegate?
    
    
    mutating func manageTodayTask() {
        lineUpClient()
        let totalTime = calculateTaskTime()
        notifyTaskCompletion(totalTime)
    }
    
    mutating func lineUpClient() {
        clientCount += 10
        var startCount = 1
        
        if clientCount == 10 {
            startCount = 1
        } else {
            startCount = clientCount - 9
        }
    
        for number in startCount...clientCount {
            guard let type = typeOfTask.randomElement() else { return }
            let currentClient = Client(waitingNumber: number, purposeOfVisit: type)
            waitingLine.enqueue(currentClient)
            delegate?.sendData(of: currentClient)
        }
    }
    
    mutating private func calculateTaskTime() -> String {
        let startTime = CFAbsoluteTimeGetCurrent()
        
        doTask()
        
        let timeOfTask = CFAbsoluteTimeGetCurrent() - startTime
        let totalTime = String(format: "%.2f", timeOfTask)
        
        return totalTime
    }
    
    mutating private func doTask() {
        for _ in 1...waitingLine.count {
            guard let currentClient = waitingLine.dequeue() else { return }
            assignToBankClerk(currentClient)
        }
        
        taskGroup.wait()
    }
    
    private func assignToBankClerk(_ currentClient: Client) {
        let depositService = DispatchWorkItem() {
            depositBankClerks.wait()
            bankClerk.service(to: currentClient)
            depositBankClerks.signal()
        }
        let loanService = DispatchWorkItem() {
            loanBankClerk.wait()
            bankClerk.service(to: currentClient)
            loanBankClerk.signal()
        }
        
        switch currentClient.purposeOfVisit {
        case .deposit:
            DispatchQueue.global().async(group: taskGroup, execute: depositService)
        case .loan:
            DispatchQueue.global().async(group: taskGroup, execute: loanService)
        }
    }
    
    private func notifyTaskCompletion(_ totalTime: String) {
        let success = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clientCount)명이며, 총 업무시간은 \(totalTime)초입니다."
        print(success)
    }
}

protocol BankDelegate {
    func sendData(of client: Client)
}
