#!/usr/bin/env perl
# Erstellt Übersicht von Kapitelgliederung und Inhaltsdateien

use List::Util qw(max);
use Encode;
use strict;
binmode STDOUT, 'utf8:';

my @files = map { chomp; $_ } `awk '/^[^ >]+\.txt/ {print}' Contents.txt`;
my $f = join ' ', @files;
my @sections = map { chomp; s/\{.*\}//g; $_ } `grep -h '^#' $f`;

my $length = max map { length $_ } @sections;

my $format = "%-${length}s | %s\n";

foreach my $file (@files) {
    my @sections = map { chomp; s/\{.*\}//g; decode_utf8($_) } `grep '^#' $file`;
    printf $format, shift @sections, $file;
    printf $format, $_ for @sections;
}
