target 'Emojize' do
  use_frameworks!
  platform :osx, '10.10'

  # pod 'Emojize', path: File.dirname(__FILE__)
  # pod 'Emojize', podspec: File.join(File.dirname(__FILE__), "Emojize.podspec")
  pod 'Emojize', git: File.join(File.dirname(__FILE__), ".git")

  # podspec name: "Emojize"

  target 'EmojizeTests' do
    inherit! :search_paths
    pod 'Quick'
    pod 'Nimble'
  end
end
