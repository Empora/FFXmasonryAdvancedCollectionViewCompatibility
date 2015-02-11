Pod::Spec.new do |s|
  s.name         = "FFXmasonryAdvancedCollectionViewCompatibility"
  s.version      = "1.0.1"
  s.summary      = "Integration of FFXMasonryLayout"

  s.description  = "Integration of Masonry layout into advanced collectionview"

  s.homepage     = "https://github.com/Empora/FFXmasonryAdvancedCollectionViewCompatibility"
  s.license      = { :type => "MIT", :file => "LICENSE.txt" }
  s.author             = { "Empora Group GmbH" => "" }
  s.platform     = :ios, "7.0"
  s.source = { :git => "https://github.com/Empora/FFXmasonryAdvancedCollectionViewCompatibility.git", :tag => s.version.to_s }
  s.source_files  = "FFXmasonryAdvancedCollectionViewCompatibility/FFXMasonryGridLayout.{h,m}","FFXmasonryAdvancedCollectionViewCompatibility/FFXMasonryGridLayoutInfo.{h,m}","FFXmasonryAdvancedCollectionViewCompatibility/FFXMasonryGridLayoutSectionInfo.{h,m}"
  s.dependency 'AAPLAdvancedCollectionView','~> 1.1.2'
  s.dependency 'FFXCollectionViewMasonryLayout','~> 1.0.0'
end
