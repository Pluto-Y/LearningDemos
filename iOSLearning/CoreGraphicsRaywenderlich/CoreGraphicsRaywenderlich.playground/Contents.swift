//: Playground - noun: a place where people can play

import UIKit

let size = CGSize(width: 120, height: 200)

UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
let context = UIGraphicsGetCurrentContext()

// Add shadow
let shadow: UIColor = UIColor.black.withAlphaComponent(0.8)
let shadowOffset = CGSize(width: 2.0, height: 2.0)
let shadowBlurRadius: CGFloat = 5

context?.setShadow(offset: shadowOffset, blur: shadowBlurRadius, color: shadow.cgColor)

context?.beginTransparencyLayer(auxiliaryInfo: nil)


// Gold colors
let darkGoldColor = UIColor(red: 0.6, green: 0.5, blue: 0.15, alpha: 1.0)
let midGoldColor = UIColor(red: 0.86, green: 0.73, blue: 0.3, alpha: 1.0)
let lightGoldColor = UIColor(red: 1.0, green: 0.98, blue: 0.9, alpha: 1.0)

// Lower Ribbon
var lowerRibbonPaht = UIBezierPath()
lowerRibbonPaht.move(to: CGPoint(x: 0, y: 0))
lowerRibbonPaht.addLine(to: CGPoint(x: 40, y: 0))
lowerRibbonPaht.addLine(to: CGPoint(x: 78, y: 70))
lowerRibbonPaht.addLine(to: CGPoint(x: 38, y: 70))
lowerRibbonPaht.close()
UIColor.red.setFill()
lowerRibbonPaht.fill()

// Clasp

var claspPath = UIBezierPath(roundedRect: CGRect(x: 36, y: 62, width: 43, height: 20), cornerRadius: 5)
claspPath.lineWidth = 5
darkGoldColor.setStroke()
claspPath.stroke()

// Medallion

var medallionPath = UIBezierPath(ovalIn: CGRect(x: 8, y: 72, width: 100, height: 100))
context?.saveGState()
medallionPath.addClip()

let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: [darkGoldColor.cgColor, midGoldColor.cgColor, lightGoldColor.cgColor] as CFArray, locations: [0, 0.51, 1])
context?.drawLinearGradient(gradient!, start: CGPoint(x: 40, y: 40), end: CGPoint(x: 100, y: 162), options: [])
context?.restoreGState()

// Create a transform
// Scale it, and translate it right and down
var transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
transform = transform.translatedBy(x: 15, y: 30)

medallionPath.lineWidth = 2.0

// apply the transform to the path
medallionPath.apply(transform)
medallionPath.stroke()

// Upper Ribbon

var upperRibbonPath = UIBezierPath()
upperRibbonPath.move(to: CGPoint(x: 68, y: 0))
upperRibbonPath.addLine(to: CGPoint(x: 108, y: 0))
upperRibbonPath.addLine(to: CGPoint(x: 78, y: 70))
upperRibbonPath.addLine(to: CGPoint(x: 38, y: 70))

UIColor.blue.setFill()
upperRibbonPath.fill()

// Number One

// Must be NSString to be able to use drawInRect()
let numberOne = "1"
let numberOneRect = CGRect(x: 47, y: 100, width: 50, height: 50)
let font = UIFont(name: "Academy Engraved LET", size: 60)
let textStyle = NSMutableParagraphStyle.default
let numberOfOneAttributes = [
    NSFontAttributeName: font!,
    NSForegroundColorAttributeName: darkGoldColor
]

(numberOne as NSString).draw(in: numberOneRect, withAttributes: numberOfOneAttributes)

context?.endTransparencyLayer()

// This code must always be at the end of  playground
let image = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext()
