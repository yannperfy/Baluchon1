//
//  NetworkClient.swift
//  BaluchonTests
//
//  Created by Yann Perfy on 19/07/2023.
//

import Foundation
private let service: MyServiceProtocol = MyService()


private func loadData() {
    service.getMyData { result in
        switch result {
        case .success:
            print("data successfuly received.")
            // Display data
        case .failure:
            print("someting went wrong...")
            // Display error
        }
    }
}
