//
//  ViewController.swift
//  ISpy
//
//  Created by Aseel Alshohatee on 2/20/19.
//  Copyright © 2019 Aseel Alshohatee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Do any additional setup after loading the view, typically from a nib.
        print("viewDidLoad, scrollView.frame.size = \(scrollView.frame.size)");
        scrollView.delegate = self;
        updateZoomFor(size: view.frame.size);
    }
    //let the user zoom far enough out to see te entire image, but , no farther
    func updateZoomFor(size: CGSize) {
        print("updateZoomFor, size = \(size), imageView.frame.size = \(imageView.frame.size)");
        let widthScale: CGFloat = size.width / imageView.frame.width;
        let heightScale: CGFloat = size.height / imageView.frame.height;
        scrollView.minimumZoomScale = min(widthScale, heightScale);
    }
    
    //MARK: UIScrollViewDelegate
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView;
    }
    //If the content does not fill the entire scrollView, center the content.
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        let top:  CGFloat = max((scrollView.frame.height - scrollView.contentSize.height) / 2, 0);
        let left: CGFloat = max((scrollView.frame.width  - scrollView.contentSize.width)  / 2, 0);
        scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: 0, right: 0);
    }
}

