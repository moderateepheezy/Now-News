//
//  SlideInPresentationManager.swift
//  MedalCount
//
//  Created by SimpuMind on 5/16/17.
//  Copyright © 2017 SimpuMind. All rights reserved.
//

import UIKit

enum PresentationDirection {
  case left
  case top
  case right
  case bottom
  case drawer
}

class SlideInPresentationManager: NSObject {
  
  var direction = PresentationDirection.left
  
  
}


extension SlideInPresentationManager: UIViewControllerTransitioningDelegate {
  
  func presentationController(forPresented presented: UIViewController,
                              presenting: UIViewController?,
                              source: UIViewController) -> UIPresentationController? {
    let presentationController = SlideInPresentationController(presentedViewController: presented,
                                                               presenting: presenting,
                                                               direction: direction)
    return presentationController
  }
  
  func animationController(forPresented presented: UIViewController,
                           presenting: UIViewController,
                           source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return SlideInPresentationAnimator(direction: direction, isPresentation: true)
  }
  
  func animationController(forDismissed dismissed: UIViewController)
    -> UIViewControllerAnimatedTransitioning? {
      return SlideInPresentationAnimator(direction: direction, isPresentation: false)
  }
  
}
