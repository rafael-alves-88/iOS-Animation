//
//  ViewController.swift
//  AnimacaoSample
//
//  Created by Thales Toniolo on 10/15/14.
//  Copyright (c) 2014 FIAP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var sonicImageView: UIImageView!

	override func viewDidLoad() {
		super.viewDidLoad()

		// Setup do sonic para animacao de corrida
		self.sonicImageView.animationDuration = 0.3
		self.sonicImageView.animationRepeatCount = 0
		var arrImages:[UIImage] = [UIImage]()
		for (var i = 1; i <= 8; i++) {
			let img:UIImage = UIImage(named: "sonic\(i)")!
			arrImages.append(img)
		}
		self.sonicImageView.animationImages = arrImages
	}

	
	@IBAction func pularActionTap(sender: UIButton) {
		let originalPosition:CGPoint = self.sonicImageView.center
		UIView.animateWithDuration(0.4, animations: { () -> Void in
			self.sonicImageView.center = CGPointMake(self.sonicImageView.center.x, self.sonicImageView.center.y-100)
		}) { (completed) -> Void in
			UIView.animateWithDuration(0.3, animations: { () -> Void in
				self.sonicImageView.center = originalPosition
			})
		}
	}

	@IBAction func girarActionTap(sender: UIButton) {
		let angle:CGFloat = 180 / 180.0 * CGFloat(M_PI)
		UIView.animateWithDuration(0.4, animations: { () -> Void in
			self.sonicImageView.transform = CGAffineTransformMakeRotation(angle)
			self.sonicImageView.transform = CGAffineTransformMakeRotation(0)
		})
	}

	@IBAction func correrPararActionTap(sender: UIButton) {
		if (self.sonicImageView.isAnimating()) {
			sender.setTitle("Correr", forState: UIControlState.Normal)
			self.sonicImageView.stopAnimating()
		} else {
			sender.setTitle("Parar", forState: UIControlState.Normal)
			self.sonicImageView.startAnimating()
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
