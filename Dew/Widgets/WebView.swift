//
//  WebView.swift
//  Dew
//
//  Created by Aleks Rutins on 3/20/23.
//
// 	https://danielsaidi.com/blog/2022/04/24/building-a-webview-for-swiftui

import Foundation
import WebKit

struct WebView : ViewRepresentable {
    public init(html: String) {
        self.html = html
        self.configuration = { _ in }
    }
    
    public init(
        html: String? = nil,
        configuration: @escaping (WKWebView) -> Void = { _ in }) {
        self.html = html
        self.configuration = configuration
    }

    private let html: String?
    private let configuration: (WKWebView) -> Void
    
    #if os(iOS)
    public func makeUIView(context: Context) -> WKWebView {
        makeView()
    }

    public func updateUIView(_ uiView: WKWebView, context: Context) {}
    #endif
    
    #if os(macOS)
    public func makeNSView(context: Context) -> WKWebView {
        makeView()
    }

    public func updateNSView(_ view: WKWebView, context: Context) {}
    #endif
}

private extension WebView {
    
    func makeView() -> WKWebView {
        let view = WKWebView()
        configuration(view)
        tryLoad(html, into: view)
        return view
    }

    func tryLoad(_ html: String?, into view: WKWebView) {
        guard let html = html else { return }
        view.loadHTMLString(html, baseURL: URL(string: "https://dev.to/"))
    }
}
