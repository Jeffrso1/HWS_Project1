//
//  ViewController.swift
//  project1_Returns
//
//  Created by Jefferson Silva on 21/05/21.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictureNames = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UITableView's configuration.
        setupNavController()
        
        tableView.register(PicturesTableViewCell.self, forCellReuseIdentifier: "Picture")
        tableView.tableFooterView = UIView()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath
        let items = try! fm.contentsOfDirectory(atPath: path!)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictureNames.append(item)
            }
        }
        
        pictureNames.sort()
    }
    
    func setupNavController() {
        navigationItem.title = "Jefferson's Pictures"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.backButtonTitle = "Back"
    }
    
}

extension ViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictureNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath) as! PicturesTableViewCell
        cell.setupPicturesCell(picture: pictureNames[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextScreen = DetailsViewController(image: pictureNames[indexPath.row], number: indexPath.row + 1, of: pictureNames.count)
        nextScreen.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
}
