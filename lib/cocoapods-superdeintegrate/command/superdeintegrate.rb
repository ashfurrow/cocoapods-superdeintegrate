module Pod
  class Command
    class Superdeintegrate < Command
      self.summary = 'Superdeintegrate CocoaPods from your project 💣.'
      self.description = <<-DESC
        Deletes the CocoaPods cache, your derived data folder, and makes sure
        that your Pods directory is gone. 
      DESC

      def run
        UI.puts("Superdeintegrating directory.".green)

        commands = ['rm -rf ~/Library/Caches/CocoaPods',
                    'rm -rf ~/Library/Developer/Xcode/DerivedData',
                    'pod deintegrate || rm -rf Pods']

        commands.each { |command| system(comment) }

        UI.puts("Finished supdeintegrating directory.")
      end
    end
  end
end
