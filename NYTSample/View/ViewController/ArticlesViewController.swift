//
//  ViewController.swift
//  NYTSample
//
//  Created by hauyadav on 07/10/18.
//  Copyright © 2018 mycompany. All rights reserved.
//

import UIKit
import PKHUD

class ArticlesViewController: UITableViewController {

    let viewModel: ArticlesTableViewModel = ArticlesTableViewModel()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "NY Times Most Popular"
        bindViewModel()
        viewModel.getArticles()
    }
    
    func bindViewModel() {
        viewModel.articleCells.bindAndFire() { [weak self] _ in
            self?.tableView?.reloadData()
        }
        
        viewModel.onShowError = { [weak self] alert in
            self?.presentSingleButtonDialog(alert: alert)
        }
        
        
        viewModel.showLoadingHud.bind() { [weak self] visible in
            if let `self` = self {
                PKHUD.sharedHUD.contentView = PKHUDSystemActivityIndicatorView()
                visible ? PKHUD.sharedHUD.show(onView: self.view) : PKHUD.sharedHUD.hide()
            }
        }
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "articleDetail",
            let destinationViewController = segue.destination as? ArticleDetailViewController {
            destinationViewController.fetchArticles = { [weak self] in
//                self?.viewModel.getArticles()
            }
        }
    }



}

// MARK: - UITableViewDelegate
extension ArticlesViewController {
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articleCells.value.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch viewModel.articleCells.value[indexPath.row] {
        case .normal(let viewModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell") as? ArticleTableViewCell else {
                return UITableViewCell()
            }
            
            cell.viewModel = viewModel
            return cell
        case .error(let message):
            let cell = UITableViewCell()
            cell.isUserInteractionEnabled = false
            cell.textLabel?.text = message
            return cell
        case .empty:
            let cell = UITableViewCell()
            cell.isUserInteractionEnabled = false
            cell.textLabel?.text = "No data available"
            return cell
        }
    }
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "articleDetail", sender: nil)
    }
    
}

extension ArticlesViewController: SingleButtonDialogPresenter { }
