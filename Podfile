# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Capo' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  pod "Apollo"
  pod 'DrawerController'
  pod 'SwiftMessages'
  pod 'LGButton'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.2'
        end
        if target.name == 'DrawerController'
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '3.2'
            end
        end

    end
end

