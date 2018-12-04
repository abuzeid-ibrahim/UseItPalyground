
//
//
//  Created by Abuzeid Ibrahim on 11/18/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//
import UIKit
/*(1)
 DON'T MARRY YOUR FRAMWORKS
 -> you could also replace it with just one line of code
 */

protocol ImageLoader{
    func loadImage(url:String)
}
extension ImageLoader{
    func loadImage(url:String){
        //you could give a default implementaion here
    }
}

final class ImageLoaderImplementor:ImageLoader{
    //also you could override your favourite framework implementation here..
}

class MyViewController{
    var imageLoader:ImageLoader!
    func viewDidLoad(){
        imageLoader.loadImage(url: "http.....")
    }
}

//=============================================================//
/*(2)
 Use internal structs to organize your constants
 //Constants.Api.baseUrl
 //Constants.Validation.firstNameMinChars
 */
struct Constants{
    static let appVersion = "1.0.9"
    
    struct Api{
        static let baseUrl = "http://www.domain.com"
        static let secretKey = "####"
    }
    struct Validation{
        static let passwordMinChars = 10
        static let firstNameMinChars = 3
    }
}

//Using
Constants.Api.baseUrl


//=============================================================//
/*(3)
 Use private extension to group yor private methods
 */
class ServiceCategoryViewController{
    
}

private extension ServiceCategoryViewController{
    func addServiceCategoriesController() {
        
        
    }
    func updateCategoriesControllerHeight() {
        
        
    }
    func removeServiceCategoriesController() {
        
        
    }
}
//=============================================================//
/*(4)
 Make it faster, add click to button in same line
 */

extension UIButton {
    private func actionHandleBlock(action: (() -> Void)? = nil) {
        struct __ {
            static var action: (() -> Void)?
        }
        if action != nil {
            __.action = action
        } else {
            __.action?()
        }
    }
    
    @objc private func triggerActionHandleBlock() {
        actionHandleBlock()
    }
    
    func addAction(control: UIControl.Event, forAction: @escaping () -> Void) {
        actionHandleBlock(action: forAction)
        addTarget(self, action: #selector(UIButton.triggerActionHandleBlock), for: control)
    }
}
//How to use
UIButton().addAction(control: .touchUpInside, forAction: {
    print("here is the action")
})
