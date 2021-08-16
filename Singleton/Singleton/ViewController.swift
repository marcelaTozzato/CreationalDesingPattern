//
//  ViewController.swift
//  Singleton
//
//  Created by Marcela Limieri Tozzato on 16/08/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let count = 100
        
        for index in 0..<count {
            AppSettings.shared.set(value: index, forKey: String(index))
        }
        
        DispatchQueue.concurrentPerform(iterations: count) { index in
            if let n = AppSettings.shared.object(forKey: String(index)) as? Int {
                print(n)
            }
        }
        
        AppSettings.shared.reset()
        
        //Arrays e Dicionarios não são thread safe, então ao tentar modifica-los por threads diferentes ao mesmo tempo leva ao crash do app:
        DispatchQueue.concurrentPerform(iterations: count) { index in
            print("Interation index \(index)")
            AppSettings.shared.set(value: index, forKey: String(index))
        }
    }
}

