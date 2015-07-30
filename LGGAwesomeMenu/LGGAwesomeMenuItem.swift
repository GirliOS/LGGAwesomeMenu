//
//  LGGAwesomeMenuItem.swift
//  LGGAwesomeMenu
//
//  Created by girlios on 7/28/15.
//  Copyright (c) 2015 GirliOS. All rights reserved.
//

import UIKit


protocol LGGAwesomeMenuItemDelegate:class {
    
    func AwesomeMenuItemTouchesBegan(item: LGGAwesomeMenuItem)
    func AwesomeMenuItemTouchesEnd(item: LGGAwesomeMenuItem)
}



class LGGAwesomeMenuItem: UIImageView {
    

    
//     var startPoint: CGPoint
//     var endPoint: CGPoint
//     var nearPoint: CGPoint
//     var farPoint: CGPoint
     var contentImageView:UIImageView
    
     weak var delegate:LGGAwesomeMenuItemDelegate?

    

    
    init(image: UIImage!, highlightedImage: UIImage?, contentImage: UIImage!, highlightedContentImage: UIImage?) {
        
        self.contentImageView = UIImageView(image: contentImage, highlightedImage: highlightedContentImage)
        super.init(image: image, highlightedImage: highlightedImage)
        self.userInteractionEnabled = true
        addSubview(self.contentImageView)

    }


    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        
        super.layoutSubviews()
        self.bounds = CGRectMake(0, 0, self.image!.size.width, self.image!.size.height)
        
        let  width  = self.contentImageView.image!.size.width
        let  height = self.contentImageView.image!.size.height
        self.contentImageView.frame = CGRectMake(self.bounds.size.width / 2, self.bounds.size.height / 2, width, height)
    }

     override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        self.highlighted = true
        delegate?.AwesomeMenuItemTouchesBegan(self)
        
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        for touch:AnyObject in touches {
            let location = touch.locationInView(self)
            
        }
    }

}
