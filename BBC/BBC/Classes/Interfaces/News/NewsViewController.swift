//
//  NewsViewController.swift
//  BBC
//
//  Created by GlobalTMS on 20/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import UIKit

let NewsToDetailsSegue = "NewsToDetailsSegue"

class NewsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewModel: NewsViewModelProtocol = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewModel.setRefreshClosure { [weak self] in
            self?.reloadData()
        }
        setupView()
        setupCollectionView()
        
        getNews()
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    
        if let new = sender as? NewsModel, let vc = segue.destination as? NewsDetailsViewController {
            vc.setUrl(new.externalUrl)
        }
    }
 
}

// MARK: UICollectionView dataSource
extension NewsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNewsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCellIdentifier, for: indexPath)
        
        if let newCell = cell as? NewsCollectionViewCell, let new = viewModel.getNew(indexPath.row) {
            newCell.setupCell(NewsCollectionViewCellStruct(title: new.title, date: new.publishingDate, description: new.description, image: new.image))
        }
        return cell
    }
    
    
}

// MARK: UICollectionView delegate FlowLayout
extension NewsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width: CGFloat
        
        if UIDevice.current.isPad {
            if UIDevice.current.isPortrait {
                width = UIScreen.main.bounds.width / 2 - 10
            } else {
                width = UIScreen.main.bounds.width / 3 - 10
            }
        } else {
            width = UIScreen.main.bounds.width
        }
        return CGSize(width: width, height: 156)
    }
}

// MAR: UICollectionView delegate
extension NewsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: NewsToDetailsSegue, sender: viewModel.getNew(indexPath.row))
    }
}

// MARK: rotation
extension NewsViewController {
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        reloadData()
    }
}

// MARK: Private methods
private extension NewsViewController {
    func setupCollectionView() {
        collectionView.register(UINib(nibName: NewsCollectionViewCellIdentifier, bundle: nil), forCellWithReuseIdentifier: NewsCollectionViewCellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func setupView() {
        let imageView = UIImageView(image: UIImage(named: "bbcLogo"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        navigationItem.titleView = imageView
    }
    
    func getNews() {
        viewModel.getNews{
            // manage error
        }
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
}
