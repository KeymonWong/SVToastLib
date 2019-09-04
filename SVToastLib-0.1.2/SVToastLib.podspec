Pod::Spec.new do |s|
  s.name = "SVToastLib"
  s.version = "0.1.2"
  s.summary = "\u{57fa}\u{4e8e}\u{4fee}\u{6539} SVProgressHUD \u{6e90}\u{7801}\u{4e4b}\u{540e}\u{7684} toast \u{5f39}\u{7a97}"
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"KeymonWong"=>"hqm_vip@163.com"}
  s.homepage = "https://www.baidu.com"
  s.description = "\u{5bf9} SVProgressHUD \u{6e90}\u{7801}\u{505a}\u{5982}\u{4e0b}\u{4fee}\u{6539}\u{ff1a}\n1. \u{65b0}\u{6dfb}\u{52a0}\u{4e86} hud \u{7684}\u{6c34}\u{5e73}\u{5e03}\u{5c40}\u{65b9}\u{5f0f}\u{ff1b}\n2. \u{65b0}\u{589e}\u{52a0}\u{4e86}\u{53ef}\u{4ee5}\u{4fee}\u{6539}\u{83ca}\u{82b1}\u{5927}\u{5c0f}\u{7684}\u{5c5e}\u{6027}\u{ff1b}\n3. \u{65b0}\u{589e}\u{52a0}\u{4e86}\u{56e0}\u{5355}\u{5229}\u{9020}\u{6210}\u{7684}\u{5f39}\u{7a97}\u{4e0d}\u{4e00}\u{81f4}\u{7684}\u{89e3}\u{51b3}\u{65b9}\u{6cd5}\u{2014}\u{2014}\u{91cd}\u{7f6e}\u{914d}\u{7f6e}\u{3002}\n\n\u{57fa}\u{4e8e}\u{4fee}\u{6539}\u{540e}\u{7684}\u{6e90}\u{7801}\u{ff0c}\u{65b0}\u{5efa}\u{4e00}\u{4e2a}\u{7ba1}\u{7406} toast \u{7684}\u{7c7b}\u{3002}"
  s.source = { :path => '.' }

  s.ios.deployment_target    = '9.0'
  s.ios.vendored_framework   = 'ios/SVToastLib.framework'
end
