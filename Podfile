workspace 'WXProgram.xcworkspace'

inhibit_all_warnings!

platform :ios, '8.0'

project 'WXMainProgram/WXMainProgram.xcodeproj'

target 'WXMainProgram' do

  pod 'YYText'

  pod 'Masonry'
  
  pod 'MJExtension'
  
  pod 'MJRefresh'
  
  pod 'SDWebImage'
    
  pod 'ReactiveObjC'
  
  pod 'MBProgressHUD'

  pod 'Reveal-iOS-SDK' ,:configurations => ['Debug']

end

target 'WXBusinessManager' do

  project 'WXBusinessManager/WXBusinessManager.xcodeproj'
  
  pod 'MJExtension'

end

target 'WXDataStoreManager' do

  project 'WXDataStoreManager/WXDataStoreManager.xcodeproj'

  pod 'FMDB'

end

target 'WXDataRequestManager' do

  project 'WXDataRequestManager/WXDataRequestManager.xcodeproj'

  pod 'AFNetworking'

end

target "CommonComponent" do

  project 'CommonComponent/CommonComponent.xcodeproj'

  pod 'Masonry'
  
  pod 'MJExtension'
  
end

