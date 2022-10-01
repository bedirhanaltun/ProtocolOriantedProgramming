//
//  ViewController.swift
//  ProtocolOriantedProgramming
//
//  Created by Bedirhan Altun on 1.10.2022.
//

import UIKit

class UserViewController: UIViewController, UserViewModelProtocol {
    
    func updateView(name: String, email: String, username: String) {
        self.nameLabel.text = name
        self.emailLabel.text = email
        self.userNameLabel.text = username
    }
    
    
    private let viewModel: UserViewModel
    
    
    private let nameLabel: UILabel = {
        
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    init(viewModel: UserViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        viewModel.fetchUsers()
    }
    
    //Constraints and Views
    private func setupViews() {
        view.backgroundColor = .green
        
        
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        view.addSubview(userNameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 60),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailLabel.heightAnchor.constraint(equalToConstant: 60),
            emailLabel.widthAnchor.constraint(equalToConstant: 200),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            
            userNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userNameLabel.heightAnchor.constraint(equalToConstant: 60),
            userNameLabel.widthAnchor.constraint(equalToConstant: 200),
            userNameLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10)
        ])
        
    }


}

