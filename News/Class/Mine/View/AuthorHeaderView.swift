//
//  AuthorHeaderView.swift
//  News
//
//  Created by Yang on 2019/10/30.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit
import IBAnimatable
import Kingfisher

class AuthorHeaderView: AnimatableView, NibLoadable {
    private let RECOMMEND_HEIGHT: CGFloat = 233
    // Tab button 宽度
    private let ITEM_TAB_BUTTON_WIDTH = screenWidth() / 5
    private let INDICATOR_WIDTH: CGFloat = 40
    private let INDICATOR_HEIGHT: CGFloat = 2
    
    private lazy var indicatorView: UIView = {
        let view = UIView(frame: CGRect(x: (self.ITEM_TAB_BUTTON_WIDTH - self.INDICATOR_WIDTH) / 2, y: self.tabScrollView.height - self.INDICATOR_HEIGHT, width: self.INDICATOR_WIDTH, height: self.INDICATOR_HEIGHT))
        view.theme_backgroundColor = "colors.global_red"
        
        return view
    } ()
    
    // 上次选中的tab
    private var lastTabButton: UIButton? = nil
    
    
    // 顶部图片
    @IBOutlet weak var topBackgroundImageView: UIImageView!
    @IBOutlet weak var topBackgroundImageViewTop: NSLayoutConstraint!
    
    // 主体Container
    @IBOutlet weak var containerView: UIView!
    // 头像图片
    @IBOutlet weak var avatarImageView: AnimatableImageView!
    
    // 发私信按钮
    @IBOutlet weak var sendMailBtn: UIButton!
    // 关注按钮
    @IBOutlet weak var concernBtn: AnimatableButton!
    // 关注右侧推荐按钮
    @IBOutlet weak var recommendBtn: AnimatableButton!
    @IBOutlet weak var recommendWidth: NSLayoutConstraint!
    @IBOutlet weak var recommendTrail: NSLayoutConstraint!
    
    @IBOutlet weak var verfyLabel: UILabel!
    
    // 推荐关注
    @IBOutlet weak var recommendView: UIView!
    @IBOutlet weak var recommendViewHeight: NSLayoutConstraint!
    
    // 名称
    @IBOutlet weak var authorNameLabel: UILabel!
    // 头条号标示
    @IBOutlet weak var toutiaohaoImageView: UIImageView!
    // 地区
    @IBOutlet weak var areaBtn: UIButton!
    @IBOutlet weak var areaBtnTop: NSLayoutConstraint!
    @IBOutlet weak var areaBtnHeight: NSLayoutConstraint!
    
    // 描述
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var descLabelHeight: NSLayoutConstraint!
    @IBOutlet weak var descLabelTop: NSLayoutConstraint!
    // 展开按钮
    @IBOutlet weak var unFoldBtn: UIButton!
    @IBOutlet weak var unFoldBtnTrail: NSLayoutConstraint!
    @IBOutlet weak var unFoldBtnWidth: NSLayoutConstraint!
    
    // 关注
    @IBOutlet weak var concernCountLabel: UILabel!
    @IBOutlet weak var concernLabel: UILabel!
    
    // 粉丝
    @IBOutlet weak var fansCountLabel: UILabel!
    @IBOutlet weak var fansLabel: UILabel!
    
    // 上下分割线
    @IBOutlet weak var topSeperator: UIView!
    @IBOutlet weak var bottomSeperator: UIView!
    // Tab
    @IBOutlet weak var tabView: UIView!
    @IBOutlet weak var tabScrollView: UIScrollView!
    
    @IBOutlet weak var containerScrollView: UIScrollView!
    
    private lazy var relationRecommendView: RelationRecommedView = {
        let view = RelationRecommedView.loadViewFromNib()
        
        return view
    } ()
    
    static var topBackgroundImageHeight: CGFloat = 146
    
    var authorInfo: AuthorInfo? {
        didSet {
            guard let info = self.authorInfo else { return }
            
            if let url = URL(string: info.avatar_url) { // 头像
                avatarImageView.kf.setImage(with: url)
            }
            if let url = URL(string: info.bg_img_url) {
                topBackgroundImageView.kf.setImage(with: url)
            }
            authorNameLabel.text = info.name
            toutiaohaoImageView.isHighlighted = !info.user_verified
            verfyLabel.text = info.verified_content
            
            concernCountLabel.text = info.followingsCount
            fansCountLabel.text = info.followersCount
            
            if info.area == "" {
                areaBtnTop.constant = 0
                areaBtnHeight.constant = 0
                areaBtn.isHidden = true
            } else {
                areaBtn.setTitle(info.area, for: .normal)
            }
            
            if info.description == "" {
                descLabelHeight.constant = 0
                descLabelTop.constant = 0
            } else {
                descLabel.text = info.description
                if info.descriptionHeight > 21 {
                    unFoldBtn.isHidden = false
                }
            }
            
            self.concernBtn.isSelected = info.is_following
            if info.is_following {      // 已关注
                self.concernBtn.backgroundColor = .gray
                self.recommendBtn.isHidden = false
                self.recommendTrail.constant = 15
            } else { // 未关注
                self.recommendBtn.isHidden = true
                self.recommendTrail.constant = 0
                self.concernBtn.backgroundColor = .red
            }
            createTab()
            layoutIfNeeded()
        }
    }
    
    var dongtais: [Dongtai]? {
        didSet {
            if dongtais != nil {
                dongtaiTableView?.reloadData()
            }
        }
    }
    var dongtaiTableView: UITableView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .clear
        
        self.concernBtn.setTitle("关注", for: .normal)
        self.concernBtn.setTitle("已关注", for: .selected)
        verfyLabel.theme_textColor = "colors.black"
        authorNameLabel.theme_textColor = "colors.black"
        authorNameLabel.theme_textColor = "colors.black"
        descLabel.theme_textColor = "colors.black"
        concernLabel.theme_textColor = "colors.black"
        fansLabel.theme_textColor = "colors.black"
        
        areaBtn.theme_setTitleColor("colors.black", forState: .normal)
        topSeperator.theme_backgroundColor = "colors.separatorColor"
        bottomSeperator.theme_backgroundColor = "colors.separatorColor"
        
        areaBtn.theme_setImage("images.author_location", forState: .normal)
        toutiaohaoImageView.theme_image = "images.author_v"
        recommendBtn.theme_setImage("images.author_arrow_up", forState: .normal)
    }
    
    /// 创建Tab
    private func createTab() {
        let height = self.tabScrollView.height
        for (index, tab) in self.authorInfo!.top_tab.enumerated() {
            let btn = UIButton(type: .custom)
            btn.frame = CGRect(x: CGFloat(index) * self.ITEM_TAB_BUTTON_WIDTH, y: 0, width: self.ITEM_TAB_BUTTON_WIDTH, height: height)
            btn.setTitle(tab.show_name, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            
            btn.theme_setTitleColor("colors.black", forState: .normal)
            btn.theme_setTitleColor("colors.global_red", forState: .selected)
            
            if index == 0 {
                btn.isSelected = true
                lastTabButton = btn
            }
            
            btn.addTarget(self, action: #selector(tabItemClick(_:)), for: .touchUpInside)
            tabScrollView.addSubview(btn)
            
            if index == self.authorInfo!.top_tab.count - 1 {
                tabScrollView.contentSize = CGSize(width: btn.right, height: height)
            }
            
            let tableView = UITableView()
            tableView.rowHeight = 144
            tableView.frame = CGRect(x: CGFloat(index) * screenWidth(), y: 0, width: screenWidth(), height: containerScrollView.height)
            containerScrollView.addSubview(tableView)
            
            if index == 0 {
                dongtaiTableView = tableView
                tableView.xRegisterCell(cell: AuthorDongtaiCell.self)
                tableView.dataSource = self
            }
        }
        
        tabScrollView.addSubview(indicatorView)
        refreshIndicatorLocation()
    }
    
    private func refreshIndicatorLocation() {
        if let btn = lastTabButton {
            UIView.animate(withDuration: 0.3) {
                self.indicatorView.centerX = btn.centerX
            }
        }
    }
    
    @objc private func tabItemClick(_ btn: UIButton) {
        if btn == lastTabButton { return }
        lastTabButton?.isSelected = false
        lastTabButton = btn
        lastTabButton?.isSelected = true
        refreshIndicatorLocation()
    }
}

// MARK: - 点击事件
extension AuthorHeaderView {
    func zoom(_ offset: CGFloat) {
        
        let height = AuthorHeaderView.topBackgroundImageHeight + abs(offset)
        
        let scale = height / AuthorHeaderView.topBackgroundImageHeight
        let width = screenWidth() * scale
        let x = -screenWidth() * (scale - 1) * 0.5
        
        topBackgroundImageView.frame = CGRect(x: x, y: offset, width: width, height: height)
    }
    
    /// 展开描述点击
    @IBAction func onUnfoldBtnClick(_ sender: UIButton) {
        unFoldBtn.isHidden = true
        unFoldBtnWidth.constant = 0
        descLabelHeight.constant = self.authorInfo!.descriptionHeight
        
        UIView.animate(withDuration: 0.3, animations: {
            self.layoutIfNeeded()
        }) { b in
            self.resetLayout()
        }
    }
    
    /// 推荐关注按钮点击
    @IBAction func onRecommendClick(_ sender: AnimatableButton) {
        
        let isSelected = !sender.isSelected
        sender.isSelected = isSelected
        recommendViewHeight.constant = isSelected ? RECOMMEND_HEIGHT : 0
        UIView.animate(withDuration: 0.3, animations: {
            sender.transform = CGAffineTransform(rotationAngle: CGFloat(isSelected ? Double.pi : 0))
            
            self.layoutIfNeeded()
        }, completion: nil)
        
    }
     
    /// 关注点击
    @IBAction func onFollowClick(_ sender: AnimatableButton) {
        if self.authorInfo!.is_following { // 已关注
            unfollowAuthor(authorInfo!.user_id, view: self) { (_) in
                self.authorInfo!.is_following = false
                self.concernBtn.isSelected = false
                
                self.concernBtn.backgroundColor = .red
                self.recommendBtn.isHidden = true
                self.recommendTrail.constant = 0
                self.recommendViewHeight.constant = 0
                
                UIView.animate(withDuration: 0.3) {
                    self.layoutIfNeeded()
                }
            }
        } else {
            followAuthor(authorInfo!.user_id, view: self) { (_) in
                self.authorInfo!.is_following = true
                self.concernBtn.isSelected = true
                
                self.concernBtn.backgroundColor = .gray
                self.recommendBtn.isHidden = false
                self.recommendTrail.constant = 15
                self.recommendViewHeight.constant = self.RECOMMEND_HEIGHT
                
                UIView.animate(withDuration: 0.3, animations: {
                    self.layoutIfNeeded()
                }) { _ in
                    recommendFollow(self.authorInfo!.user_id) { (cards) in
                        self.recommendView.addSubview(self.relationRecommendView)
                        self.relationRecommendView.userCards = cards
                    }
                }
            }
        }
    }
    
    private func resetLayout() { }
}


// MARK: - TableView DataSource
extension AuthorHeaderView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dongtais == nil ? 0 : dongtais!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.xDequeueReusableCell(indexPath: indexPath) as AuthorDongtaiCell
        cell.dongtai = dongtais![indexPath.row]
        return cell
    }
}
