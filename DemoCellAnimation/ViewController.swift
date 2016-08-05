//
//  ViewController.swift
//  DemoCellAnimation
//
//  Created by yeguoshuai on 16/8/4.
//  Copyright © 2016年 AK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tableView: UITableView!;
    var oldMove: CGFloat? = 0
    var scal: CGFloat = 1.0
    var SelectedView: UIImageView?

    let img = ["1.png","2.jpg","3.jpg","4.jpg","2.jpg","3.jpg","4.jpg","2.jpg","3.jpg","4.jpg","2.jpg","3.jpg","4.jpg","2.jpg","3.jpg","4.jpg","2.jpg","3.jpg","4.jpg","2.jpg","3.jpg","4.jpg","2.jpg","3.jpg","4.jpg","2.jpg","3.jpg","4.jpg"]


    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView = UITableView.init(frame: self.view.bounds, style: .Plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)

        tableView.registerNib(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

// MARK:- delegate
// MARK:-
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return img.count
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 141;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! TableViewCell
        cell.imgView.image = UIImage(named: img[indexPath.row])
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        let vc = ViewController2()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)

        vc.complateBlock = {
            (button,index) in
            print("block 告诉你 你点击了按钮")
        }

        let cell = tableView.cellForRowAtIndexPath(indexPath) as? TableViewCell
        self.SelectedView = cell!.imgView


    }
    func scrollViewDidScroll(scrollView: UIScrollView) {



        for cell in self.tableView.visibleCells {
            //计算cell的中心坐标相对于父视图的坐标
            let pointY = cell.convertPoint(CGPointMake(cell.bounds.size.width*0.5, cell.bounds.size.height * 0.5), toView: self.view).y
            //计算相对坐标与父视图的坐标的间距 除以屏幕高度的一半  计算移动的百分比
            var sub = (pointY-(UIScreen .mainScreen().bounds.size.height/1.5))/(UIScreen .mainScreen().bounds.size.height/2.0);
            print("the offset.y  \(pointY)   -----   \(sub)")

            let celll = cell as! TableViewCell

//            //下边两句是为了增加过度进度
//            if sub > 0 {
//                sub = sub+0.2
//            }else if sub < 0 {
//                sub = sub-0.2
//            }
            if (celll.topConstraint != nil && celll.bottomConstaint != nil) {
                celll.topConstraint.constant = -67+67*min(max(sub, -1), 1)
                celll.bottomConstaint.constant = -67-67*min(max(sub, -1), 1)
                celll.contentView.layoutIfNeeded()
            }

        }
        print("------------------------------------------")

    }
}
// MARK: - 
// MARK: - ClickDelegate
extension ViewController: ClickDelegate {
    func BtnClick(button: UIButton, index: Int) {
        print("你点击了按钮。。。。")
    }
}

extension ViewController: UINavigationControllerDelegate {
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        if operation == .Push {
            return Animation()
        }else {
            return nil
        }


    }
}
