use strict;
use vars qw($VERSION %IRSSI);

use Irssi;
use Growl::GNTP;

$VERSION = '0.0.5';
%IRSSI = (
	authors     => 'Ben Phelps',
	contact     => 'bphelpsen@gmail.com',
	name        => 'gnotifer',
	description => 'Send Growl notifications.',
	url         => 'http://gnotifer.64bits.co/',
	license     => 'CC BY-NC-SA 3.0'
);

my $growl = Growl::GNTP->new(
	AppName => 'IRSSI Notification',
	PeerHost => '', # Your IP address
	PeerPort => 23053, # Your port, porbably this
	Password => '', # Your password
	AppIcon => 'http://dl.dropbox.com/u/19145606/irssi-icon.png'
);

sub priv_msg {
	my ($server,$msg,$nick,$address,$target) = @_;
	growl($nick . " " . $msg);
}

sub highlight {
    my ($dest, $text, $stripped) = @_;
    if ($dest->{level} & MSGLEVEL_HILIGHT) {
		growl($dest->{target}. " \n " .$stripped);
    }
}

sub growl {	
	my ($text) = @_;
	my @values = split(' ', $text, 2);
	$growl->notify(
		Event => 'IRSSI_NOTIFY',
		Title => 'IRSSI Notification',
		Message => '' . @values[0] . "\n" . @values[1] . '',
		Icon => 'http://dl.dropbox.com/u/19145606/irssi-icon.png',
	);
}

Irssi::signal_add_last('message private', 'priv_msg');
Irssi::signal_add_last('print text', 'highlight');