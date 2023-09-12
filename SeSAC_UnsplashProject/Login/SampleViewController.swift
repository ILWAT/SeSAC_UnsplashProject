//
//  SampleViewController.swift
//  SeSAC_UnsplashProject
//
//  Created by 문정호 on 2023/09/12.
//

import UIKit

class SampleViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    let viewModel = SampleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var number1 = 10
        var number2 = 3
        
        print(number1 - number2) //7
        
        number1 = 3
        number2 = 1
        
        //Observerble 형태로 변환
        
        var number3 = Observable(10)
        var number4 = Observable(3)
        
        number3.bind { number in 
            print("Observable", number3.value - number4.value)
        }
        
        number3.value = 100
        number3.value = 500
        number3.value = 50
        
        

        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
}

extension SampleViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberofRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "sampleCell") else { return UITableViewCell()}
        let data = viewModel.cellForRowAt(at: indexPath)
        cell.textLabel?.text = data.introduce
        return cell
    }
    
    
}
