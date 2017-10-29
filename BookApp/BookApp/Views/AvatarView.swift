/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

@IBDesignable
class AvatarView: UIView {
  
  let margin: CGFloat = 30.0
  let labelName = UILabel()
  let imageView = UIImageView()
    
    let layerAvatar = CAShapeLayer()
    
    let layerGradiendt = CAGradientLayer()
    
    @IBInspectable var strokeColor: UIColor = UIColor.black{
        didSet{
            configure()
        }
    }
    
    @IBInspectable
    var startColor: UIColor = UIColor.white {
        didSet{
            configure()
        }
    }
    
    @IBInspectable
    var endColor: UIColor = UIColor.black{
        didSet{
            configure()
        }
    }
  @IBInspectable var imageAvatar: UIImage? {
    didSet {
      configure()
    }
  }
  
  @IBInspectable var avatarName: String = "" {
    didSet {
      configure()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setup()
  }
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setup()
  }

  func setup() {
    
    layer.addSublayer(layerGradiendt)

    layerAvatar.fillColor = nil
    layerAvatar.lineWidth = 10.0
    layerAvatar.contentsGravity = kCAGravityResizeAspectFill
    layer.addSublayer(layerAvatar)
    
    // Setup label
    labelName.font = UIFont(name: "AvenirNext-Bold", size: 28.0)
    labelName.textColor = UIColor.black
    labelName.translatesAutoresizingMaskIntoConstraints = false
    addSubview(labelName)
    labelName.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .vertical)
    
    // Add constraints for label
    let labelCenterX = labelName.centerXAnchor.constraint(equalTo: self.centerXAnchor)
    let labelBottom = labelName.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    NSLayoutConstraint.activate([labelCenterX, labelBottom])
  }
  
  func configure() {
    // Configure image view and label
    layerAvatar.contents = imageAvatar?.cgImage
    layerAvatar.strokeColor = strokeColor.cgColor
    labelName.text = avatarName
    
    // Configure Gradient
    layerGradiendt.colors = [startColor.cgColor , endColor.cgColor]
    layerGradiendt.startPoint = CGPoint(x: 0.5, y: 0)
    layerGradiendt.endPoint = CGPoint(x: 0.5, y: 1)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    let layerAvatarHeight = self.bounds.height - margin - labelName.bounds.height
    layerAvatar.frame = CGRect(x: self.bounds.width / 2 - layerAvatarHeight/2, y: margin, width: layerAvatarHeight, height: layerAvatarHeight)
    let maskLayer = CAShapeLayer()
    maskLayer.path = UIBezierPath(ovalIn: layerAvatar.bounds).cgPath
    layerAvatar.mask = maskLayer
    layerAvatar.path = maskLayer.path
    
    
    // Gradient
    layerGradiendt.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: layerAvatar.frame.midY)
  }
  
}
