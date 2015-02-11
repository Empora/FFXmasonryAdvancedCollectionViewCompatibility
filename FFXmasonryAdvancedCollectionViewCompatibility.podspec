Pod::Spec.new do |s|
  s.name         = "FFXmasonryAdvancedCollectionViewCompatibility"
  s.version      = "1.0.0"
  s.summary      = "Integration of FFXMasonryLayout into AdvancedCollectionView"

  s.description  = <<-DESC
                   A longer description of FFXmasonryAdvancedCollectionViewCompatibility in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  s.homepage     = "https://github.com/Empora/FFXmasonryAdvancedCollectionViewCompatibility"
  s.license      = { :type => "MIT", :file => "LICENSE.txt" }
  s.author             = { "Empora Group GmbH" => "" }
  s.platform     = :ios, "7.0"
  s.source = { :git => "https://github.com/Empora/FFXmasonryAdvancedCollectionViewCompatibility.git", :tag => s.version.to_s }
  s.source_files  = "FFXmasonryAdvancedCollectionViewCompatibility/FFXMasonryGridLayout.{h,m}","FFXmasonryAdvancedCollectionViewCompatibility/FFXMasonryGridLayoutInfo.{h,m}","FFXmasonryAdvancedCollectionViewCompatibility/FFXMasonryGridLayoutSectionInfo.{h,m}"
  s.dependency 'AAPLAdvancedCollectionView','~> 1.1.2'
  s.dependency 'FFXCollectionViewMasonryLayout','~> 1.0.0'
end
