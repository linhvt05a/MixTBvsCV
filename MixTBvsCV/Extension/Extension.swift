

import UIKit

extension UIView
{
    
    var left:CGFloat
        {
        set(x)
        {
            var frame:CGRect=self.frame
            frame.origin.x=round(x)
            self.frame=frame
        }
        get
        {
            return self.frame.origin.x
        }
    }
    
    
    var top:CGFloat
        {
        set(y)
        {
            var frame:CGRect=self.frame
            frame.origin.y=round(y)
            self.frame=frame
        }
        get
        {
            return self.frame.origin.y
        }
    }
    
    
    var width:CGFloat
        {
        set(width)
        {
            var frame:CGRect=self.frame
            frame.size.width = round(width)
            self.frame = frame
        }
        get
        {
            return self.frame.size.width
        }
    }
    
    var height:CGFloat
        {
        set(height)
        {
            var frame:CGRect=self.frame
            frame.size.height = round(height)
            self.frame = frame
        }
        get
        {
            return self.frame.size.height
        }
    }
    
    var right:CGFloat
        {
        set(right)
        {
            var frame:CGRect=self.frame
            frame.origin.x = round(right-self.width)
            self.frame = frame
        }
        get
        {
            return self.frame.origin.x + self.frame.size.width
        }
    }
    
    
    var bottom:CGFloat
        {
        set(bottom)
        {
            var frame:CGRect=self.frame
            frame.origin.y = round(bottom-self.height)
            self.frame = frame
        }
        get
        {
            return self.frame.origin.y + self.frame.size.height
        }
    }
    
    func addDropShadow()
    {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 6
        self.layer.shadowOpacity = 0.1
    }
    
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle  = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
