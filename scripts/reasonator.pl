#!/usr/bin/env perl
use v5.14;
my $url = "http://meta.wikimedia.org/wiki/Reasonator/stringprops?action=raw";
open my $fh, "curl -s '$url' |";
while (<$fh>) {
    /^\|+\s*([^}-].+)/ or next;
    my @token = split /\s*\|\|\s*/, $1;
    $token[2] =~ s/!ID!/{ID}/g;
    say join ', ', $token[1], $token[0], $token[2];
}
