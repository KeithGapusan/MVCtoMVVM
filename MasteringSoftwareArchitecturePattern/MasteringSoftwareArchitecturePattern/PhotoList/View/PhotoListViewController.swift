//
//  PhotoListTableViewCellTableViewCell.swift
//  MVVMPlayground
//
//  Created by Keith Gapusan on 19/07/2018.
//  Copyright © 2018 ST.Huang. All rights reserved.
//


import UIKit
import SDWebImage

class PhotoListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    let viewModel = PhotoListViewModel()
    var selectedIndexPath: IndexPath?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Init the static view
        initView()
        //initData()
        
        viewModel.getPhotoList { [weak self] in
        self?.activityIndicator.stopAnimating()
        UIView.animate(withDuration: 0.2, animations: {
                        self?.tableView.alpha = 1.0
                })
        self?.tableView.reloadData()
        }
        
        
    }
    
    func initView() {
        self.navigationItem.title = "Popular"
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetail" {
            if let indexPath = sender as? IndexPath{
                if let vc = segue.destination as? PhotoDetailViewController
                {
                    print("1")
                    print(sender ?? "")
                    let photo = viewModel.getCurrentObject(atIndex: (indexPath.row))
                    vc.imageUrl = photo.image_url
                }
            }
          
        }
        
    }
}

extension PhotoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "photoCellIdentifier", for: indexPath) as? PhotoListTableViewCell else {
            fatalError("Cell not exists in storyboard")
        }
        
        
        configureCell(indexPath, cell)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photo = viewModel.getCurrentObject(atIndex: indexPath.row)
        if photo.for_sale {
            print("selected \(indexPath.row)")
            performSegue(withIdentifier: "toDetail", sender: indexPath)
            
        }else {
            let alert = UIAlertController(title: "Not for sale", message: "This item is not for sale", preferredStyle: .alert)
            alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
          
        }
    }
    


}

extension PhotoListViewController {

    
    
    fileprivate func configureCell(_ indexPath: IndexPath, _ cell: PhotoListTableViewCell) {
        
        let photo = viewModel.getCurrentObject(atIndex: indexPath.row)
        //Text
        cell.nameLabel.text = photo.name
        
        //Wrap a description
        var descText: [String] = [String]()
        if let camera = photo.camera {
            descText.append(camera)
        }
        if let description = photo.description {
            descText.append( description )
        }
        cell.descriptionLabel.text = descText.joined(separator: " - ")
        
        //Wrap the date
        let dateFormateer = DateFormatter()
        dateFormateer.dateFormat = "yyyy-MM-dd"
        cell.dateLabel.text = dateFormateer.string(from: photo.created_at)
        
        //Image
        cell.mainImageView.sd_setImage(with: URL(string: photo.image_url), completed: nil)
    }
}



