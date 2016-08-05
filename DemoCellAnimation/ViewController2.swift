//
//  ViewController2.swift
//  DemoCellAnimation
//
//  Created by yeguoshuai on 16/8/5.
//  Copyright © 2016年 AK. All rights reserved.
//

import UIKit

protocol ClickDelegate: NSObjectProtocol {
    func BtnClick(button: UIButton,index: Int) -> ();
}

typealias ClickBlock = (button: UIButton,index: Int)->()

class ViewController2: UIViewController {

    @IBOutlet weak var btnClick: UIButton!
    weak var delegate: ClickDelegate?
    var  complateBlock: ClickBlock?
    var testBlock: ((btn: UIButton, index: Int)->())?

//    var _btn: UIButton?
//    var btn:UIButton? {
//        set{
//            _btn = newValue
//        }
//        get {
//            return _btn
//        }
//    }

    var btn: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.view.addSubview(btn!)
    }


    @IBAction func btnClick(sender: UIButton) {
        delegate?.BtnClick(sender, index: 1)
        complateBlock?(button: sender,index: 1)
        //TODO:-这是测试的代码
        //FIXME:- 快来拯救我
        testBlock?(btn: sender,index: 1)
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
