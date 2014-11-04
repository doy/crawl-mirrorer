#!/usr/bin/env perl
use strict;
use warnings;

use Plack::Request;

sub {
    my $req = Plack::Request->new($_[0]);
    system("git fetch --prune --tags");
    system("git push --mirror");
    return [200, ['Content-Type' => 'text/plain'], ['']];
};
