//
//  ViewController.swift
//  ReceipeApp
//
//  Created by Suraj Ghadge on 19/08/19.
//  Copyright © 2019 Suraj Ghadge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        //self.navigationController?.navigationBar.backItem?.title = " "
        self.navigationController?.navigationBar.topItem?.title = "";
    }

    @IBAction func Login(_ sender: UIButton) {
        print("Login Clicked")
        login(email: emailTextField.text!, password: passwordTextField.text!)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
      //  self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func login(email : String, password : String) {
        let Url = String(format: "https://reqres.in/api/login")
        guard let serviceUrl = URL(string: Url) else { return }
        let parameterDictionary = [
            "email" : email,
            "password":password] as [String : String]
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
            return
        }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response as? HTTPURLResponse{
                let statusCode = response.statusCode
                self.checkStatusCode(code: statusCode)
                print(statusCode)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print("Inner Json : \(json)")
                } catch {
                    print(error)
                }
            }
            }.resume()
    }
    
    func checkStatusCode(code : Int) {
         DispatchQueue.main.async {
            if(code == 200){
                    self.show(self.storyboard!.instantiateViewController(withIdentifier: "HomeViewController"), sender: self)
                }
            else if(code == 400){
                    let alert = UIAlertController(title: "Oops!!!", message: "Please Enter Password...", preferredStyle: UIAlertController.Style.alert)
                
                    // add the actions (buttons)
                alert.addAction(UIAlertAction(title: "Retry", style: UIAlertAction.Style.default, handler: self.doSomething(action:)))
                
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                
            }
        }
        
        
    }
    
    func doSomething(action: UIAlertAction) {
        print("Retry")
    }
}

