//
//  FirstViewModal.swift
//  InterviewPreparation
//
//  Created by Apple on 23/03/22.
//

import Foundation
import Combine


enum CustomError: Error {
    case badURL
    case parserError
    case unknown
}
class APIManager {
    
    
    func getAPICall(url: URL, compilation: @escaping (Result<Data?,CustomError>) -> ()){
        URLSession.shared.dataTask(with: url, completionHandler:{ (data,response,err) in
            // here we have check for status code also
            if let _ = err, data == nil {
                
                compilation(.failure(.badURL))
            }else {
                compilation(.success(data))
            }
        })
        .resume()
    }
}
class FirstViewModal {
    
    private let apiManager: APIManager
    
    let courseList:[Course] = [
        Course(id: .combine, name: "Combine"),
        Course(id: .compositionalLayout, name: "Compositional Layout"),
        Course(id: .tvOS, name: "TV OS"),
        Course(id: .operationQueue, name: "Operation Queue"),
        Course(id: .gcd, name: "GCD"),
        Course(id: .viper, name: "VIPER"),
        Course(id: .swiftUI, name: "SwiftUI"),
        Course(id: .uiKitSwiftUI, name: "UIKit to SwiftUI"),
    ]
  //  let questionList: [String] = ["Compositional Layout","Combine","TV OS","Operation Queue","GCD","VIPER","SwiftUI","UIKit to SwiftUI"]

    
    init(apiManager:APIManager) {
        self.apiManager = apiManager
    }
    
    func getEmployees(compilation: @escaping (Result<Employee,CustomError>) -> ()){
        let urlSting = "\(BaseURL.url)\(EndPoint.employees)"
        guard let url = URL(string: urlSting)else {return}
        
        apiManager.getAPICall(url: url, compilation: {res in
            switch res {
            case.success(let data):
                // parsing data 
                guard let response = data?.getModal(modal: Employee.self) else {return
                    compilation(.failure(.parserError))
                }
                compilation(.success(response))
            case.failure(let err):
                debugPrint(err.localizedDescription)
                compilation(.failure(.unknown))
            }
        })
    }
}


struct Course {
    let id: QuestionType
    let name: String
    
}

enum QuestionType: Int {
    case compositionalLayout
    case combine
    case tvOS
    case operationQueue
    case gcd
    case viper
    case swiftUI
    case uiKitSwiftUI
}



struct BaseURL{
    static let url: String = "http://dummy.restapiexample.com"
}

struct EndPoint{
    static let employees: String = "/api/v1/employees/"
}

extension Data {
    func getModal<T:Codable>(modal : T.Type) -> T?{
        do {
            let modal  = try JSONDecoder().decode(modal, from:self)
            return modal
        } catch let parsingError {
            print("Error", parsingError)
        }
        return nil
    }
}

