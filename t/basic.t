use strict;
use warnings;

use Test::More tests => 7;

require_ok("Audio::Mixer");

is( Audio::Mixer::init_mixer(), 0, "Initialize Mixer" );

my ( @old ) = Audio::Mixer::get_cval('vol');
cmp_ok( scalar @old, ">", 0 , "Got existing volume levels");

Audio::Mixer::set_cval('vol', 50);
my ( @new ) = Audio::Mixer::get_cval('vol');
is( $new[0], 50, "Set left channel to 50");
is( $new[1], 50, "Set right channel to 50");

Audio::Mixer::set_cval('vol', $old[0], $old[1]);
my ( @final ) = Audio::Mixer::get_cval('vol');
is( $final[0], $old[0], "Restored left channel");
is( $final[1], $old[1], "Restored right channel");

done_testing;
