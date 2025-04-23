import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shimmer/shimmer.dart'; // Import shimmer package

class WebViewPage extends StatefulWidget {

  const WebViewPage({
    super.key,
  });

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController controller;
  bool isLoading = true;
  bool _hasError = false; // Add error state
  bool _isInitialLoad = true; // Track if it's the initial home page load

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setUserAgent("Mozilla/5.0 (Linux; Android 10; SM-G975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36") // Set User Agent
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
              _hasError = false; // Reset error on new page start
              // Check if the URL is the initial home page
              _isInitialLoad = (url == 'https://bootig.com/');
            });
          },
          onPageFinished: (String url) {
            // Only set isLoading to false if no error occurred
            if (!_hasError) {
              setState(() {
                isLoading = false;
              });
            }
          },
          onNavigationRequest: (NavigationRequest request) {
              if (request.url.startsWith('https://wa.me/')) {
                launchUrl(Uri.parse(request.url), mode: LaunchMode.externalApplication);
                return NavigationDecision.prevent;
              }
              else if (request.url.startsWith('tel:')) {
                launchUrl(Uri.parse(request.url), mode: LaunchMode.externalApplication);
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;

          },


        ),
      )
      ..loadRequest(
        Uri.parse('https://bootig.com/'),
        headers: {'Cache-Control': 'no-cache'},
      );

  }

  Widget _buildHomePageShimmer() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder for a banner
          Container(
            width: double.infinity,
            height: 150.0,
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 16.0),
          ),
          // Placeholder for category boxes
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(4, (index) => Container(
              width: 60.0,
              height: 60.0,
              color: Colors.white,
            )),
          ),
          const SizedBox(height: 24.0),
          // Placeholder for product items grid
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.8, // Adjust aspect ratio as needed
              ),
              itemCount: 6, // Example number of items
              itemBuilder: (context, index) => Container(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for the generic page shimmer
  Widget _buildGenericPageShimmer() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white, // Use white as the base for the shimmer effect
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            if (!isLoading )
              WebViewWidget(controller: controller),

            // Show shimmer loading indicator
            if (isLoading)
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: _isInitialLoad ? _buildHomePageShimmer() : _buildGenericPageShimmer(),
              ),
          ],
        ),
      ),
    );
  }
}