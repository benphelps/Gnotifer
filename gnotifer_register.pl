use Growl::GNTP;
my $growl = Growl::GNTP->new(
	AppName => 'IRSSI Notification',
	PeerHost => '', # your IP
	PeerPort => 23053, # your port, probably this
	Password => '', # your password
	AppIcon => 'http://dl.dropbox.com/u/19145606/irssi-icon.png' # change if you want, its a nice dark red irssi flame
);
$growl->register([{
	Name        => 'IRSSI_NOTIFY',
	DisplayName => 'IRSSI Notification',
	Enabled     => 'True',
	Icon        => 'http://dl.dropbox.com/u/19145606/irssi-icon.png'
}]);