module Pod
  class Command
    class Superdeintegrate < Command
      self.summary = 'Superdeintegrate CocoaPods from your project 💣.'
      self.description = <<-DESC
        Deletes the CocoaPods cache, your derived data folder, and makes sure
        that your Pods directory is gone. 
      DESC

      def run
        require 'fileutils'
        require 'pod/command/deintegrate'
        
        UI.section "Superdeintegrating directory." do
          FileUtils.rm_rf config.cache_root
          FileUtils.rm_rf '~/Library/Developer/Xcode/DerivedData'
          begin
            Pod::Command::Deintegrate.invoke
          rescue
            FileUtils.rm_rf config.sandbox_root
          end
        end

        UI.puts("Finished supdeintegrating directory.".green)
      end
    end
  end
end
