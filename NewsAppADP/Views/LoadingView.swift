//
//  LoadingView.swift
//  NewsAppADP
//
//  Created by Lara on 12.07.2025..
//
import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
        }
    }
}
