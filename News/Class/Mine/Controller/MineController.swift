//
//  XiguaController.swift
//  News
//
//  Created by Yang on 2019/10/23.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit
import SwiftTheme
import RxSwift
import RxCocoa

class MineController: BaseTableViewController {
    private let disposeBag = DisposeBag()

    var mCellItems = mineCellItems
    var mConcerns: [ConcernItem]? = nil
    
    private lazy var headerView: NoLoginHeaderView = {
        let header = NoLoginHeaderView.headerView()
        return header
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.rowHeight = 44
        self.tableView.separatorStyle = .none
        self.tableView.tableHeaderView = headerView
        self.tableView.xRegisterCell(cell: ConcernCell.self)
        self.tableView.xRegisterCell(cell: MineItemCell.self)
        
        get(apiConcern, type: ApiResultList<ConcernItem>.self, view: self.view, success: { result in
            if result != nil {
                self.mConcerns = result!.data
                self.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
            }
        })
        
        headerView.moreLoginBtn.rx.controlEvent(.touchUpInside).subscribe(onNext: { [weak self] in
            
            let controller = createViewControllerFromStoryboard(MoreLoginController.self)
            controller.modalPresentationStyle = .custom
            
            self?.present(controller, animated: true, completion: nil)
        }).disposed(by: self.disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        headerView.zoom(offset)
    }
}

// MARK: -- DataSource And Delegate
extension MineController {
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth(), height: 10))
        view.theme_backgroundColor = "colors.separatorColor"
        return view
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return mCellItems.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mCellItems[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = mCellItems[indexPath.section][indexPath.row]
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = tableView.xDequeueReusableCell(indexPath: indexPath) as ConcernCell
            cell.selectionStyle = .none
            cell.setItem(item: item)
            cell.concerns = mConcerns
            return cell
        }
        
        let cell = tableView.xDequeueReusableCell(indexPath: indexPath) as MineItemCell
        cell.selectionStyle = .none
        cell.setItem(item: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return (mConcerns != nil && mConcerns!.count > 1) ? 112 : 44
        }
        return 44
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let row = indexPath.row
        let title = mCellItems[indexPath.section][indexPath.row].title
        switch indexPath.section {
        case 0:break
        case 1: break
        case 2:
            if row == 1 {
                let controller = SettingController()
                controller.title = title
                self.navigationController?.pushViewController(controller, animated: true)
            }
        default:
            break
        }
    }
}
