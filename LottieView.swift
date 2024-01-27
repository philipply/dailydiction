//
//  LottieView.swift
//  DailyDiction2
//
//  Created by Philipp Ley on 20.01.24.
//

import Lottie
import UIKit
import SwiftUI

struct LottieView: UIViewRepresentable {
    
    typealias UIViewType = UIView
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        
        // Add Animation
        let animationView = LottieAnimationView()
        animationView.animation = LottieAnimation.named("Animation")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // do nothing
    }
}

