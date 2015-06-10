require File.expand_path('../../spec_helper', __FILE__)

module Pod
  describe Command::Superdeintegrate do
    describe 'CLAide' do
      it 'registers it self' do
        Command.parse(%w{ superdeintegrate }).should.be.instance_of Command::Superdeintegrate
      end
    end
  end
end

